import os

def create_pdf(filename):
    # We build the PDF as a list of raw byte objects
    raw_objects = []

    def add_stream_obj(stream_content: str) -> str:
        """Add a stream object, computing the exact byte length."""
        stream_bytes = stream_content.encode('latin-1')
        content = b"<< /Length " + str(len(stream_bytes)).encode() + b" >>\nstream\n" + stream_bytes + b"\nendstream"
        obj_id = len(raw_objects) + 1
        raw_objects.append(content)
        return f"{obj_id} 0 R"

    def add_dict_obj(dictionary: str) -> str:
        """Add a plain dictionary object."""
        obj_id = len(raw_objects) + 1
        raw_objects.append(dictionary.encode('latin-1'))
        return f"{obj_id} 0 R"

    # Object 1 – Font
    font_ref = add_dict_obj("<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold >>")

    # Page 1 – text + bar chart
    page1_stream = (
        "BT /F1 18 Tf 72 740 Td (Page 1: Sample PDF Document) Tj ET\n"
        "BT /F1 11 Tf 72 715 Td (This is an automatically generated 2-page sample document.) Tj ET\n"
        "BT /F1 11 Tf 72 700 Td (It contains text and a bar chart on page 1, and a line graph on page 2.) Tj ET\n"
        "BT /F1 13 Tf 72 660 Td (Bar Chart: Quarterly Sales) Tj ET\n"
        "BT /F1 9 Tf 55 490 Td (200) Tj ET\n"
        "BT /F1 9 Tf 55 440 Td (150) Tj ET\n"
        "BT /F1 9 Tf 55 390 Td (100) Tj ET\n"
        "BT /F1 9 Tf 55 340 Td (50) Tj ET\n"
        "0.8 0.8 0.8 RG 0.5 w\n"
        "72 490 m 400 490 l S\n"
        "72 440 m 400 440 l S\n"
        "72 390 m 400 390 l S\n"
        "72 340 m 400 340 l S\n"
        "0.24 0.52 0.78 rg\n"
        "100 290 45 100 re f\n"
        "170 290 45 150 re f\n"
        "240 290 45 80 re f\n"
        "310 290 45 200 re f\n"
        "0 0 0 rg\n"
        "BT /F1 9 Tf 110 278 Td (Q1) Tj ET\n"
        "BT /F1 9 Tf 180 278 Td (Q2) Tj ET\n"
        "BT /F1 9 Tf 250 278 Td (Q3) Tj ET\n"
        "BT /F1 9 Tf 320 278 Td (Q4) Tj ET\n"
        "0 0 0 RG 1 w\n"
        "72 290 m 72 500 l S\n"
        "72 290 m 400 290 l S\n"
    )
    content1_ref = add_stream_obj(page1_stream)

    # Page 2 – text + line graph
    page2_stream = (
        "BT /F1 18 Tf 72 740 Td (Page 2: Trend Analysis) Tj ET\n"
        "BT /F1 11 Tf 72 715 Td (The line graph below shows a simulated monthly trend.) Tj ET\n"
        "BT /F1 13 Tf 72 660 Td (Line Graph: Monthly Values) Tj ET\n"
        "BT /F1 9 Tf 50 540 Td (600) Tj ET\n"
        "BT /F1 9 Tf 50 490 Td (500) Tj ET\n"
        "BT /F1 9 Tf 50 440 Td (400) Tj ET\n"
        "BT /F1 9 Tf 50 390 Td (300) Tj ET\n"
        "0.8 0.8 0.8 RG 0.5 w\n"
        "72 540 m 450 540 l S\n"
        "72 490 m 450 490 l S\n"
        "72 440 m 450 440 l S\n"
        "72 390 m 450 390 l S\n"
        "0.84 0.19 0.19 RG 2 w\n"
        "72 390 m\n"
        "132 420 l\n"
        "192 460 l\n"
        "252 410 l\n"
        "312 510 l\n"
        "372 545 l\n"
        "432 530 l\n"
        "S\n"
        "0.84 0.19 0.19 rg\n"
        "72 390 3 3 re f\n"
        "132 420 3 3 re f\n"
        "192 460 3 3 re f\n"
        "252 410 3 3 re f\n"
        "312 510 3 3 re f\n"
        "372 545 3 3 re f\n"
        "432 530 3 3 re f\n"
        "0 0 0 rg\n"
        "BT /F1 8 Tf 68 370 Td (Jan) Tj ET\n"
        "BT /F1 8 Tf 128 370 Td (Feb) Tj ET\n"
        "BT /F1 8 Tf 188 370 Td (Mar) Tj ET\n"
        "BT /F1 8 Tf 248 370 Td (Apr) Tj ET\n"
        "BT /F1 8 Tf 308 370 Td (May) Tj ET\n"
        "BT /F1 8 Tf 368 370 Td (Jun) Tj ET\n"
        "BT /F1 8 Tf 428 370 Td (Jul) Tj ET\n"
        "0 0 0 RG 1 w\n"
        "72 380 m 72 560 l S\n"
        "72 380 m 450 380 l S\n"
    )
    content2_ref = add_stream_obj(page2_stream)

    # Page objects
    page1_ref = add_dict_obj(
        f"<< /Type /Page /Parent 6 0 R /MediaBox [0 0 612 792]"
        f" /Resources << /Font << /F1 {font_ref} >> >>"
        f" /Contents {content1_ref} >>"
    )
    page2_ref = add_dict_obj(
        f"<< /Type /Page /Parent 6 0 R /MediaBox [0 0 612 792]"
        f" /Resources << /Font << /F1 {font_ref} >> >>"
        f" /Contents {content2_ref} >>"
    )

    # Pages + Catalog
    pages_ref = add_dict_obj(f"<< /Type /Pages /Kids [{page1_ref} {page2_ref}] /Count 2 >>")
    catalog_ref = add_dict_obj(f"<< /Type /Catalog /Pages {pages_ref} >>")

    # Write the PDF
    with open(filename, "wb") as f:
        f.write(b"%PDF-1.4\n%\xe2\xe3\xcf\xd3\n")  # header + binary comment to signal binary file
        offsets = []
        for i, obj_content in enumerate(raw_objects):
            offsets.append(f.tell())
            obj_num = i + 1
            f.write(f"{obj_num} 0 obj\n".encode())
            f.write(obj_content)
            f.write(b"\nendobj\n")

        xref_offset = f.tell()
        num_objs = len(raw_objects)
        f.write(f"xref\n0 {num_objs + 1}\n".encode())
        f.write(b"0000000000 65535 f \n")
        for offset in offsets:
            f.write(f"{offset:010d} 00000 n \n".encode())

        f.write(
            f"trailer << /Size {num_objs + 1} /Root {catalog_ref} >>\n"
            f"startxref\n{xref_offset}\n%%EOF\n".encode()
        )

if __name__ == "__main__":
    if os.path.basename(os.getcwd()) != 'assets' and os.path.exists('assets'):
        os.chdir('assets')
    create_pdf("sample.pdf")
    print("Generated 2-page sample.pdf with text and graphs")
