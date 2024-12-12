import SwiftUI

struct ReusableCalendarView: View {
    @Binding var selectedColor: Color
    @Binding var selectedDate: Date
    let daysOfWeek: [String]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    
    var body: some View {
        VStack {
            // Color Picker
            LabeledContent("Calendar Color") {
                ColorPicker("", selection: $selectedColor, supportsOpacity: false)
            }
            
            // Date Picker
            LabeledContent("Date/Time") {
                DatePicker("", selection: $selectedDate)
            }
            
            // Weekday Headers
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .fontWeight(.black)
                        .foregroundStyle(selectedColor)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Calendar Grid
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { day in
                    if day.monthInt != selectedDate.monthInt {
                        Text("")
                    } else {
                        Text(day.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(
                                Circle()
                                    .foregroundStyle(
                                        Date.now.startOfDay == day.startOfDay
                                        ? .red.opacity(0.3)
                                        : selectedColor.opacity(0.3)
                                    )
                            )
                    }
                }
            }
        }
        .padding()
        .onAppear {
            days = selectedDate.calendarDisplayDays
        }
        .onChange(of: selectedDate) {
            days = selectedDate.calendarDisplayDays
        }
    }
}

#Preview {
    @State var previewColor = Color.blue
    @State var previewDate = Date.now
    
    return ReusableCalendarView(
        selectedColor: $previewColor,
        selectedDate: $previewDate,
        daysOfWeek: Date.capitalizedFirstLettersOfWeekdays
    )
}
