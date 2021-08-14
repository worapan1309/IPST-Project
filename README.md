# IPST-Project

Folder
  - Resources: เก็บ keyword และ variable ที่จำเป็นสำหรับการทดสอบ
    - Keywords: เก็บ Keyword ที่สร้างขึ้นมาเพื่อใช้ในการทดสอบ
      - Pages: เก็บ keyword โดยแยกตามแต่ละ page (.resource)
    - Locator: เก็บ variable (locator) ที่จะต้องใช้ในการทดสอบ
      - Pages: เก็บ variable โดยแยกตามแต่ละ page (.resource)
  - TestCases: เก็บ test cases สำหรับ automated testing (.robot)
  - TestData: เก็บ test data ที่จำเป็นต้องใช่ในการทดสอบ (.yaml)

การตั้งชื่อ
- การตั้งชื่อตัวแปร Locator -> ${PAGE.NAME.TYPE} เช่น ${HOME.VDTOUCH.INPUT}    xPath=//input
- การตั้งชื่อตัวแปร Mock (ทดสอบเล่น ๆ ยังไม่ใช่ของจริง) -> ${page.name.type} เช่น ${home.vdtouch.input}    xPath=//input
- การตั้งชื่อไฟล์ -> ใช้ตัวพิมพ์เล็กและมี _ คั่น เช่น login_page.resource
- การตั้งชื่อ Keyword -> เว้นวรรคแต่ละคำ และเขียนคำต่อไปด้วยตัวพิมพ์ใหญ่ เช่น Click Login Button
