# Hướng Dẫn Cấu Hình Codemagic CI/CD

## Tổng Quan

Dự án này sử dụng **Codemagic** cho tích hợp liên tục và triển khai liên tục (CI/CD). Tệp cấu hình `codemagic.yaml` xác định các quy trình công việc tự động để xây dựng, kiểm tra và triển khai ứng dụng Flutter của bạn.

## Các Quy Trình Công Việc Khả Dụng

### 1. **analyze-and-test** (Pull Requests & Push)

- Chạy trên mọi pull request và push
- Thực hiện phân tích mã bằng `flutter analyze`
- Chạy tất cả các bài kiểm tra đơn vị và widget
- Báo cáo kết quả cho GitHub Issues

### 2. **android-release** (Build Phát Hành)

- Kích hoạt trên các nhánh `release/*` và các push lên `main`
- Xây dựng release APK và App Bundle
- Tự động xuất bản lên Google Play Store (bản internal)
- Yêu cầu thông tin xác thực ký Android

### 3. **ios-release** (Build Phát Hành)

- Kích hoạt trên các nhánh `release/*` và các push lên `main`
- Xây dựng và lưu trữ ứng dụng iOS
- Xuất bản lên TestFlight
- Yêu cầu chứng chỉ ký iOS và hồ sơ cấp phát

### 4. **web-release** (Build Phát Hành)

- Xây dựng ứng dụng web với bộ render HTML
- Xuất bản lên Firebase Hosting
- Kích hoạt trên các nhánh phát hành và main

### 5. **android-debug** (Pull Requests trên develop)

- Build debug để kiểm tra
- Kích hoạt trên PR nhánh `develop`

### 6. **ios-debug** (Pull Requests trên develop)

- Build debug iOS để kiểm tra
- Kích hoạt trên PR nhánh `develop`

## Hướng Dẫn Cấu Hình

### Bước 1: Kết Nối Kho Lưu Trữ với Codemagic

1. Truy cập [Bảng Điều Khiển Codemagic](https://codemagic.io)
2. Đăng nhập hoặc tạo tài khoản
3. Nhấp **Add repository** (Thêm kho lưu trữ)
4. Chọn kho dự án Flutter của bạn
5. Codemagic sẽ tự động phát hiện `codemagic.yaml`

### Bước 2: Cấu Hình Biến Môi Trường

Thêm các biến sau trên bảng điều khiển Codemagic:

**Cho Android:**

- `PACKAGE_NAME`: Tên gói của ứng dụng (vd: `com.example.app`)
- `GOOGLE_PLAY_TRACK`: Bản phát hành (`internal`, `alpha`, `beta`, hoặc `production`)
- `GCLOUD_SERVICE_ACCOUNT_CREDENTIALS`: JSON tài khoản dịch vụ Google Play được mã hóa Base64

**Cho iOS:**

- `APP_ID`: ID ứng dụng của bạn
- `BUNDLE_ID`: Định danh gói của bạn (vd: `com.example.app`)

**Cho Web/Firebase:**

- `FIREBASE_TOKEN`: Token Firebase CLI
- `FIREBASE_PROJECT_ID`: ID dự án Firebase của bạn
- `FIREBASE_IOS_APP_ID`: ID ứng dụng Firebase iOS
- `FIREBASE_ANDROID_APP_ID`: ID ứng dụng Firebase Android

### Bước 3: Cấu Hình Ký

#### Ký Android

1. Tải tệp keystore của bạn trong Codemagic
2. Đặt tên tham chiếu keystore thành `keystore_reference`
3. Thêm biến môi trường:
   - `CM_KEYSTORE_PASSWORD`
   - `CM_KEY_ALIAS_PASSWORD`
   - `CM_KEY_ALIAS`

#### Ký iOS

1. Trong Codemagic, điều hướng đến **Signing certificates** (Chứng chỉ ký)
2. Tải chứng chỉ phát triển/phân phối Apple
3. Tải các hồ sơ cấp phát
4. Đặt các tham chiếu thành `certificate_reference` và `provision_profile_reference`

### Bước 4: Cấu Hình Các Nhánh Git

Cập nhật các mẫu nhánh trong `codemagic.yaml` nếu cần:

- `develop`: Để xây dựng phát triển
- `release/*`: Để xây dựng phát hành
- `main`: Để phát hành sản xuất

## Xây Dựng Cục Bộ

Bạn có thể kiểm tra các lệnh xây dựng cục bộ trước khi đẩy:

```bash
# Cài đặt dependencies
melos bootstrap
melos get

# Phân tích mã
melos analyze

# Chạy kiểm tra
melos test

# Xây dựng Android APK
flutter build apk --release --split-per-abi

# Xây dựng Android App Bundle
flutter build appbundle --release

# Xây dựng iOS
flutter build ios --release

# Xây dựng Web
flutter build web --release --web-renderer html
```

## Giám Sát Build

1. Xem trạng thái build trên bảng điều khiển Codemagic
2. Kiểm tra nhật ký build để có đầu ra chi tiết
3. Cấu hình thông báo Slack/email trong cài đặt
4. Tích hợp GitHub hiển thị trạng thái build trên PR

## Khắc Phục Sự Cố

### Các Vấn Đề Thường Gặp

**Vấn đề: Build thất bại với "Flutter version not found"**

- Giải pháp: Chỉ định phiên bản Flutter trong môi trường Codemagic hoặc sử dụng FVM

**Vấn đề: Không tìm thấy lệnh Melos**

- Giải pháp: Đảm bảo `melos` được cài đặt: `dart pub global activate melos`

**Vấn đề: Lỗi ký mã**

- Giải pháp: Xác minh rằng các chứng chỉ và hồ sơ cấp phát được tải lên chính xác

**Vấn đề: Hết thời gian build**

- Giải pháp: Tăng `max_build_duration` trong cấu hình quy trình công việc

## Các Thực Hành Tốt Nhất

1. **Sử dụng phiên bản ngữ nghĩa** cho các bản phát hành
2. **Kiểm tra cục bộ** trước khi đẩy lên các nhánh main/release
3. **Giám sát các chỉ số build** - kiểm tra thời lượng và tỷ lệ thành công
4. **Giữ dependencies cập nhật** thông qua PR tự động
5. **Sử dụng quy tắc bảo vệ nhánh** để yêu cầu các build thành công trước khi hợp nhất
6. **Cấu hình thông báo** cho các lỗi build

## Tích Hợp GitHub

Quy trình công việc `analyze-and-test` tự động:

- Thêm kiểm tra trạng thái build vào PR
- Nhận xét trên PR với kết quả kiểm tra
- Báo cáo vấn đề cho GitHub Issues

## Các Liên Kết Hữu Ích

- [Tài Liệu Codemagic](https://docs.codemagic.io)
- [Tài Liệu Tham Khảo YAML Codemagic](https://docs.codemagic.io/yaml/overview/)
- [Tài Liệu Flutter](https://flutter.dev/docs)
- [Tài Liệu Melos](https://melos.invertase.dev)

## Có Câu Hỏi?

Để biết thêm thông tin, vui lòng tham khảo:

- Hỗ trợ Codemagic: https://support.codemagic.io
- Cộng đồng Flutter: https://flutter.dev/community

## Thông Tin Bổ Sung

### Cách Thức Hoạt Động

1. **Pull Request**: Bất cứ khi nào bạn tạo PR, quy trình công việc `analyze-and-test` sẽ chạy tự động để đảm bảo mã của bạn không có lỗi.

2. **Push lên Develop**: Khi bạn push lên nhánh `develop`, các build debug cho Android và iOS sẽ được kích hoạt.

3. **Release**: Khi bạn tạo nhánh `release/*` hoặc push lên `main`, các build phát hành cho tất cả các nền tảng sẽ được kích hoạt và tự động triển khai.

### Kiểm Tra Trạng Thái Build

Bạn có thể kiểm tra trạng thái build trực tiếp trên:

- Bảng điều khiển Codemagic: https://codemagic.io
- GitHub: Xem trạng thái build trên PR hoặc commit
- Email/Slack: Nhận thông báo tự động về các build hoàn thành

### Gỡ Lỗi Build Thất Bại

Nếu build thất bại:

1. Nhấp vào build đó trên bảng điều khiển Codemagic
2. Xem nhật ký build chi tiết để tìm thông báo lỗi
3. Sao chép lệnh build từ log và chạy cục bộ để sao chép vấn đề
4. Sửa lỗi và push lại
