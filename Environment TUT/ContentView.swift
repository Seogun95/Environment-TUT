import SwiftUI

// 1. 기본값으로 키 생성
private struct CaptionColorKey: EnvironmentKey {
  static let defaultValue = Color(.secondarySystemBackground)
}

// 2. 속성을 통해 환경 확장
extension EnvironmentValues {
  var captionBackgroundColor: Color {
    get { self[CaptionColorKey.self] }
    set { self[CaptionColorKey.self] = newValue }
  }
}

// 3. 뷰 수정자 추가(선택사항)
extension View {
  func captionBackgroundColor(_ color: Color) -> some View {
    environment(\.captionBackgroundColor, color)
  }
}
// 4. Environment에 의존하여 배경색을 설정하는 수정자
struct Caption: ViewModifier {
  let font: Font
  @Environment(\.captionBackgroundColor) var backgroundColor

  func body(content: Content) -> some View {
    content
      .font(font)
      .padding([.leading, .trailing], 5.0)
      .background(backgroundColor)
      .cornerRadius(5.0)
  }
}

extension View {
  func caption(font: Font = .caption) -> some View {
    modifier(Caption(font: font))
  }
}


// ContentView
struct ContentView : View {
  
    var body: some View {
        Text("서근 개발블로그")
          .caption(font: .largeTitle)
          .captionBackgroundColor(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .previewLayout(.sizeThatFits)
                
    }
}


