import SwiftUI

struct AlarmViewTest: View {
    @State private var alarms: [Alarm] = []
    @State private var showAddAlarmView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(alarms) { alarm in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(alarm.time, style: .time)
                                .font(.largeTitle)
                                .foregroundColor(alarm.isOn ? .white : .gray)
                            Text(alarm.label)
                                .foregroundColor(alarm.isOn ? .white : .gray)
                        }
                        Spacer()
                        Toggle("", isOn: Binding<Bool>(
                            get: { alarm.isOn },
                            set: { newValue in
                                if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
                                    alarms[index].isOn = newValue
                                }
                            }
                        ))

                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
                                alarms.remove(at: index)
                            }
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                    .contextMenu {
                        Button(action: {
                            if let index = alarms.firstIndex(where: { $0.id == alarm.id }) {
                                alarms[index].isOn.toggle()
                            }
                        }) {
                            Label(alarm.isOn ? "Turn Off" : "Turn On", systemImage: alarm.isOn ? "bell.slash.fill" : "bell.fill")
                        }
                        
                        Button(action: {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms.remove(at: index)
                            }
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Alarms")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddAlarmView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.orange)
                    }
                }
            }
            .sheet(isPresented: $showAddAlarmView) {
                AddAlarmView(alarms: $alarms)
            }
        }
    }
}


struct AlarmTest: Identifiable, Equatable {
    static func == (alarm1: Alarm, alarm2: Alarm) -> Bool {
        return true
    }
    
    var id = UUID() // provide default value
    var time: Date
    var label = "" // provide default value
    var isOn: Bool
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmViewTest()
    }
}
