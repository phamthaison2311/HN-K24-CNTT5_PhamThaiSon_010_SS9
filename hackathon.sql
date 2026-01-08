CREATE database hackathon;
USE hackathon;

-- PHẦN 1: TẠO CSDL VÀ CÁC BẢNG:
-- 1. Tạo bảng (15 điểm) Tạo 4 bảng Department, Employee, Project, Assignment với cấu trúc và kiểu dữ liệu hợp lý. Đảm bảo có các khóa chính (PK) và khóa ngoại (FK) để liên kết các bảng.
CREATE TABLE Department (
	dept_id VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE, 
    location VARCHAR(100),
    manager_name VARCHAR(50)
);

CREATE TABLE Employee (
	emp_id VARCHAR(5) PRIMARY KEY,
    emp_name VARCHAR(50),
    dob DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    dept_id VARCHAR(5)
);

CREATE TABLE Project (
	project_id VARCHAR(5),
    project_name VARCHAR(20) UNIQUE,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2)
);

CREATE TABLE Assignment (
	assignment_id INT,
    emp_id VARCHAR(5),
    project_id VARCHAR(5),
    role VARCHAR(20),
    hours_worked INT
);

-- Chèn dữ liệu (10 điểm) Thêm dữ liệu vào 4 bảng đã tạo:
INSERT INTO Department(dept_id, dept_name, location, manager_name)
VALUES 
('D01', 'IT', 'Floor 5', 'Nguyen Van An'),
('D02', 'HR', 'Floor 2', 'Tran Thi Binh'),
('D03', 'Sales', 'Floor 1', 'Le Van Cuong'),
('D04', 'Marketing', 'Floor 3', 'Pham Thi Duong'),
('D05', 'Finance', 'Floor 4', 'Hoang Van Tu');

INSERT INTO Employee(emp_id, emp_name, dob, email, phone, dept_id)
VALUES
('E001', 'Nguyen Van Tuan', '1990-01-01', 'tuan@mail.com', '0901234567', 'D01'),
('E002', 'Tran Thi Lan', '1995-05-05', 'lan@mail.com', '0902345678', 'D02'),
('E003', 'Le Minh Khoi', '1992-10-10', 'khoi@mail.com', '0903456789', 'D01'),
('E004', 'Pham Hoang Nam', '1998-12-12', 'nam@mail.com', '0904567890', 'D03'),
('E005', 'Vu Minh Ha', '1996-07-07', 'ha@mail.com', '0905678901', 'D01');

INSERT INTO Project(project_id, project_name, start_date, end_date, budget)
VALUES
('P001', 'Website Redesign', '2025-01-01', '2025-06-01', '50000.00'),
('P002', 'Mobile App Dev', '2025-02-01', '2025-08-01', '80000.00'),
('P003', 'HR System', '2025-03-01', '2025-09-01', '30000.00'),
('P004', 'Marketing Campaign', '2025-04-01', '2025-05-01', '10000.00'),
('P005', 'AI Research', '2025-05-01', '2025-12-31', '100000.00');

INSERT INTO Assignment(assignment_id, emp_id, project_id, role, hours_worked)
VALUES
('1', 'E001', 'P001', 'Developer', '150'),
('2', 'E003', 'P001', 'Tester', '100'),
('3', 'E001', 'P002', 'Tech Lead', '200'),
('4', 'E005', 'P005', 'Data Scientist', '180'),
('5', 'E004', 'P004', 'Content Creator', '50');

-- PHẦN 2: TRUY VẤN DỮ LIỆU CƠ BẢN
-- 3. Cập nhật thông tin phòng ban. Hãy viết câu lệnh thay đổi địa điểm của phòng ban có dept_id = 'C001' thành "Floor 10".(5 điểm)
UPDATE 
-- 4. Thay đổi ngân sách. Do dự án có mã P005 có độ phức tạp cao, hãy tăng budget thêm 10% đơn vị và cập nhật end_date lùi lại 1 tháng.(5 điểm)

-- 5. Viết câu lệnh xóa tất cả các bản ghi trong bảng Assignment có hours_worked bằng 0 hoặc role là "Intern".(5 điểm)

-- 6. Liệt kê danh sách nhân viên gồm các cột: emp_id, emp_name, email thuộc phòng ban có mã  'D01'. (5 điểm)
SELECT e.emp_id, e.emp_name, e.email FROM Employee e
WHERE dept_id = 'D01';
-- 7. Lấy thông tin project_name, start_date, budget của những dự án có tên chứa từ khóa là 'System'.(5 điểm) 
SELECT p.project_name, p.start_date, p.budget FROM Project p
WHERE project_name LIKE '%System%';
-- 8. Hiển thị danh sách tất cả các dự án gồm: project_id, project_name, budget. Kết quả sắp xếp theo budget giảm dần.(5 điểm) 
SELECT p.project_name, p.start_date, p.budget FROM Project p
ORDER BY budget;
-- 9. Lấy thông tin 3 nhân viên lớn tuổi nhất theo dob trong bảng Employee.(5 điểm)
SELECT * FROM Employee
ORDER BY dob LIMIT 3;
-- 10. Hiển thị thông tin các sản phẩm (project_id, project_name) từ bảng Project, bỏ qua 1 bản ghi đầu tiên và lấy 3 bản ghi tiếp theo .(5 điểm)
SELECT * FROM Project
LIMIT 3 OFFSET 1;
-- PHẦN 3: TRUY VẤN DỮ LIỆU NÂNG CAO
-- 11. Hiển thị danh sách đơn hàng gồm: assignment_id, emp_name , project_name  và role. Chỉ lấy những đơn hàng có hours_worked lớn hơn 100. (5 điểm)

-- 12. Liệt kê tất cả các phòng ban trong hệ thống gồm: dept_id, dept_name và emp_name tương ứng (nếu có). Kết quả phải bao gồm cả những phòng ban chưa có nhan viên nào. (5 điểm)

-- 13. Tính tổng số giờ làm việc cho từng dự án. Kết quả hiển thị 2 cột: project_name và Total_Hours. (5 điểm)

-- 14. Thống kê số lượng nhân viên của mỗi phòng ban. Hiển thị dept_name và Employee_Count. Chỉ hiện những phòng ban có từ 2 nhân viên trở lên.(5 điểm)

-- 15. Lấy thông tin chi tiết các nhân viên (emp_name, email) đã tham gia các dự án có ngân sách cao hơn 50000.(5 điểm)

-- 16. Hiển thị emp_name và role của những nhân viên thuộc phòng ban 'IT' và đang tham gia vào dự án 'Website Redesign'. (5 điểm)

-- 17. Hiển thị thông tin tổng hợp gồm: emp_id, emp_name, dept_name, project_name và hours_worked. (5 điểm)





