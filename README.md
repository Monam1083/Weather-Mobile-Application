# ⛅ Weather App

A clean and minimal Flutter weather application that fetches real-time weather data using the [OpenWeatherMap API](https://openweathermap.org/api). Search any city to instantly view temperature, humidity, wind speed, sunrise/sunset times, and animated weather conditions.

---

## 📱 Screenshots

<img width="170" height="300" alt="image" src="https://github.com/user-attachments/assets/e422c07b-17aa-42da-b36f-9c8f9ca32d51" />
<img width="170" height="300" alt="image" src="https://github.com/user-attachments/assets/d2ed1258-2b38-4853-990b-a94cd4a195e0" />

## 📱Demo

https://github.com/user-attachments/assets/0314b3d6-5588-4522-b052-89942f57c362


---

## ✨ Features

- 🔍 Search weather by city name
- 🌡️ Real-time temperature in °C
- 💧 Humidity and 💨 wind speed display
- 🌅 Sunrise & sunset times
- 🎨 Dynamic gradient background based on weather condition
- 🎞️ Lottie animations for rain, sunny, and cloudy conditions
- ⚡ Loading indicator while fetching data

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| Weather API | OpenWeatherMap |
| HTTP Client | `http` package |
| Animations | `lottie` package |
| Date Formatting | `intl` package |

---

## 📁 Project Structure

```
lib/
├── main.dart                  # App entry point
├── models/
│   └── weather_model.dart     # Weather data model
├── services/
│   └── weather_service.dart   # API calls
├── screens/
│   └── home_screen.dart       # Main screen UI
└── widgets/
    └── weather_card.dart      # Weather display card

assets/
├── rain.json                  # Lottie animation
├── sunny.json                 # Lottie animation
└── cloudy.json                # Lottie animation
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or later)
- An [OpenWeatherMap API key](https://home.openweathermap.org/api_keys) (free tier works)
- Android Studio / VS Code with Flutter extension

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Monam1083/Weather-Mobile-Application
   cd Weather-Mobile-Application
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your API key**

   Open `lib/services/weather_service.dart` and replace the placeholder:
   ```dart
   final String apikey = "YOUR_API_KEY_HERE";
   ```

4. **Add Lottie animation assets**

   Place your `.json` Lottie files in the `assets/` folder and ensure `pubspec.yaml` includes:
   ```yaml
   flutter:
     assets:
       - assets/rain.json
       - assets/sunny.json
       - assets/cloudy.json
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 📦 Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  lottie: ^3.0.0
  intl: ^0.19.0
```

---

## 🔑 API Reference

This app uses the **OpenWeatherMap Current Weather API**:

```
GET https://api.openweathermap.org/data/2.5/weather?q={city}&appid={apikey}
```

| Field Used | Source in JSON |
|---|---|
| City Name | `json["name"]` |
| Temperature | `json["main"]["temp"]` (converted from Kelvin) |
| Description | `json["weather"][0]["description"]` |
| Humidity | `json["main"]["humidity"]` |
| Wind Speed | `json["wind"]["speed"]` |
| Sunrise | `json["sys"]["sunrise"]` |
| Sunset | `json["sys"]["sunset"]` |

---

## 🏗️ Build APK

```bash
# Debug build
flutter build apk

# Release build
flutter build apk --release

# Split by ABI (smaller size)
flutter build apk --split-per-abi
```

Output: `build/app/outputs/flutter-apk/app-release.apk`



## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

---



## 🙏 Acknowledgements

- [OpenWeatherMap](https://openweathermap.org/) for the free weather API
- [LottieFiles](https://lottiefiles.com/) for animation assets
- [Flutter](https://flutter.dev/) team for the amazing framework
