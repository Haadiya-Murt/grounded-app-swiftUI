//
//  ContentView.swift
//  InteractiveElements
//
//  Created by Ashley McCallum on 2026-04-07.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    @State private var fontSize = 14
    @State private var opacity = 0.5
    @State private var progress = 0.0
    @State private var selectedRole = "Student"
    let roles = ["Student", "Teacher", "Admin"]
    @State private var birthDate = Date()
    @State private var selectedColor = Color.purple
    
    var body: some View {
        VStack {
            Text("Interactive Elements")
                .font(.largeTitle)
                .bold()
            
            //scrollview allows our content to be scrollable
            ScrollView {
                VStack {
                    
                    /* ------------------------ TOGGLE ------------------------ */
                    HStack {
                        Text("Toggle")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //switches between true and false / on and off
                    //our variable isDarkMode is set to false as default, so our toggle will start as "off"
                    //if we want it to start "on" then we should set isDarkMode to be true by default
                    Toggle("Toggle Dark Mode", isOn: $isDarkMode)
                    Text(isDarkMode ? "Dark Mode Enabled" : "Light Mode")
                    //we can use ternary operators to do simple checks for if our toggle is on or off
                    //example: if the toggle is on, set the background colour to black, if not then white
                        .background(isDarkMode ? Color.black : Color.white)
                        .foregroundStyle(isDarkMode ? .white : .black)
                    
                    Divider()
                    
                    /* ------------------------ STEPPER ------------------------ */
                    HStack {
                        Text("Stepper")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //gives us buttons that increase or decrease a value
                    //we can give it a range (in: 10...30 <- our stepper can't go under 10 or above 30)
                    //we can also tell it how big each "step" can be (step: 2 <- increase or decrease by 2 instead of 1)
                    //we can remove the "step" parameter if we want it to go up and down by 1
                    Stepper("Font size: \(fontSize)", value: $fontSize, in: 10...30, step: 2)
                    Text("Sample Text")
                        .font(.system(size: CGFloat(fontSize)))
                    
                    Divider()
                    
                    /* ------------------------ SLIDER ------------------------ */
                    HStack {
                        Text("Slider")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //gives us a sliding scale that increases or decreases a value
                    //can give it a range (in: 0...1 <- our slider only has values between 0 and 1)
                    //can also give it a "step" to make it slide in specific increments (step: 0.1)
                    //we can remove the "step" parameter so it slides smoothly
                    //our opacity variable is set to 0.5 by default, so our slider will start in the middle
                    //if we wanted it to start at a different value, we would just need to set that as the default for our variable
                    Slider(value: $opacity, in: 0...1, step: 0.1)
                    Text("Opacity Preview")
                        .opacity(opacity)
                    Text("Opacity Value: \(opacity, specifier: "%.2f")") //our text here is formatted to show 2 decimal places
                    
                    Divider()
                    
                    /* ------------------------ PROGRESSVIEW ------------------------ */
                    HStack {
                        Text("ProgressView")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //usually used as an indicator that something is loading or to indicate progress being made
                    //this version gives us the spinning wheel <- often used when loading images or online content
                    ProgressView()
                    //this version gives us a progress bar <- example: showing the user how far they are in a multi-page form
                    ProgressView(value: progress)
                        .tint(.pink)
                    //in this case we have a button here to increase the "progress" of our loading
                    Button("Load More") {
                        if progress < 1.0 {
                            progress += 0.1
                            
                            if progress >= 1.0 {
                                progress = 1.0
                            }
                        }
                    }
                    Text("Progress: \(progress.formatted(.percent))") //our text is formatted as a percentage
                    
                    Divider()
                    
                    /* ------------------------ GAUGE ------------------------ */
                    HStack {
                        Text("Gauge")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //gauge also can be used to show progress, or a current level such as battery charge, temperature, etc
                    Gauge(value: progress, in: 0...1) {
                        Text("Level")
                    } currentValueLabel: {
                        Text("\(progress.formatted(.percent))")
                    }
                    .gaugeStyle(.accessoryCircular) //different gauge styles are available (circular & linear)
                    .scaleEffect(1.5)
                    .padding(.vertical)
                    .tint(.green)
					
                    Divider()
                    
                    /* ------------------------ PICKER ------------------------ */
                    HStack {
                        Text("Picker")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //allows us to select an item from a list
                    //often used with arrays which hold all of the available items
                    //our picker will show "Student" by default because that is what is set in our selectedRole variable
                    //if we wanted a different default to show we would just change that variable
                    Picker("Select your role", selection: $selectedRole) {
                        //ForEach is commonly used with pickers to load & display all of the options from the array
                        ForEach(roles, id: \.self) {
                            Text($0) //this is just short form for grabbing each item in the array and putting it in a text
                        }
                    }
                    .pickerStyle(.segmented) //there are different styles available <- menu is the default style (drop-down list)
                    
                    //by using a segmented picker, we can make it look almost like there are mini tabs in our app by loading different content based on the picker selection
                    if selectedRole == "Teacher" {
                        Text("Welcome Educator!")
                        Image(systemName: "books.vertical")
                            .resizable()
                            .frame(width: 50, height: 50)
                    } else if selectedRole == "Admin" {
                        HStack {
                            Image(systemName: "wrench")
                            Text("Access Granted.")
                        }
                    } else {
                        HStack {
                            Text("Let's Learn!")
                            Image(systemName: "graduationcap")
                        }
                        
                    }
                    
                    Divider()
                    
                    /* ------------------------ DATEPICKER ------------------------ */
                    HStack {
                        Text("DatePicker")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //allows us to work with date and time
                    //we can limit the options available by choosing the displayedComponents, in this case we want date only
                    //we can also remove the displayedComponents parameter if we want all options available (date & time)
                    //there are also different datePickerStyle options
                    //.compact gives us drop-down menu style, .wheel gives us dates/times on a wheel, .graphical gives us a calendar
                    DatePicker("Select your birthday", selection: $birthDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                    
                    //there are also different ways to format dates
                    //.abbreviated here is shortening the month and day down to "Apr 7"
                    //check the documentation for different date formats available (ex. including the day name, full month name vs number, etc)
                    //we can also omit the time to keep things looking simpler
                    Text("Your birthday: \(birthDate.formatted(date: .abbreviated, time: .omitted))")
                    
                    Divider()
                    
                    /* ------------------------ COLORPICKER ------------------------ */
                    HStack {
                        Text("ColorPicker")
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }
                    
                    //gives us access to colour selection
                    //all of the menus that pop up when the user clicks on this element are built in, so we don't need to do anything more than this to add it
                    ColorPicker("Pick your colour", selection: $selectedColor)
                    Rectangle()
                        .fill(selectedColor)
                        .frame(width: 100, height: 100)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
