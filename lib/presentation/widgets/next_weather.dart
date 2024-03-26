import 'package:flutter/material.dart';

class NextWeatherWidget extends StatelessWidget {
  const NextWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF001026).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Next Forecast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(Icons.calendar_today, color: Colors.white),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),

          // weekly Date
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Monday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Sun_cloud.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Tuesday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Sun_cloud_rain.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Wednesday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/rain_drops.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Thursday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Cloud 3 zap.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Friday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Sun_cloud.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Saturday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Sun_cloud.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Sunday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Sun_cloud.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '13°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '10°',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
