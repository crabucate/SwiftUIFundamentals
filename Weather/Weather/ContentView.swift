//
//  ContentView.swift
//  SwiftUI-Weather-SeanAllen
//
//  Created by Felix Leitenberger on 03.11.20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    let weatherArray = [
        Weather(day: "MON", symbol: .cloudy, temp: "12"),
        Weather(day: "TUE", symbol: .mixed, temp: "13"),
        Weather(day: "WED", symbol: .sunny, temp: "14"),
        Weather(day: "THU", symbol: .thunder, temp: "15"),
        Weather(day: "FRI", symbol: .windy, temp: "17"),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
            CityTextView(cityName: "München")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                
                HStack(spacing: 20) {
                    ForEach(weatherArray) { result in
                        DayView(weather: result)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                    NetworkManager.shared.getWeather { (result) in
                        switch result {
                        case.failure(.notWork):
                            print("Fail")
                        case .success(let result):
                            print(result.map {
                                $0.temp.day
                            })
                        }
                    }
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}


struct DayView: View {
    
    let weather: Weather
    
    var body: some View {
        VStack {
            Text(weather.day)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weather.symbol.rawValue)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(weather.temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? .black : .blue,
                                 isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 34, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {

    let imageName: String
    let temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
