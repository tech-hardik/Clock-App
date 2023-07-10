//
//  AddAlarmView.swift
//  ClockApp
//
//  Created by alex on 3/15/23.
//

import SwiftUI

struct AddAlarmView: View {
    @Binding var alarms: [Alarm]
    @State private var date = Date()
    @State private var label = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select time", selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                GroupBox {
                    TextField("Label", text: $label)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                Spacer()
            }
            .padding(.top, 50)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        alarms.append(Alarm(time: date, label: label, isOn: true))
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.title3)
                            .foregroundColor(.orange)
                            .bold()
                    }
                }
            }
        }
    }
}

struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        let alarms = Binding.constant([Alarm]())
        AddAlarmView(alarms: alarms)
    }
}
