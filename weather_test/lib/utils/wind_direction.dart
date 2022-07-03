/// The class determines the direction of the wind by the obtained angle value
class WindDirection {
  ///[directionDegree] - wind angle
  String chooseWindDirection(int? directionDegree) {
    if (directionDegree == null) {
      return '';
    }
    switch ((directionDegree / 10).ceil() * 10) {
      case 350:
      case 360:
      case 10:
        {
          return 'N';
        }
      case 20:
      case 30:
        {
          return 'N/NE';
        }
      case 40:
      case 50:
        {
          return 'NE';
        }
      case 60:
      case 70:
        {
          return 'E/NE';
        }
      case 80:
      case 90:
      case 100:
        {
          return 'E';
        }
      case 110:
      case 120:
        {
          return 'E/SE';
        }
      case 130:
      case 140:
        {
          return 'SE';
        }
      case 150:
      case 160:
        {
          return 'S/SE';
        }
      case 170:
      case 180:
      case 190:
        {
          return 'S';
        }
      case 200:
      case 210:
        {
          return 'S/SW';
        }
      case 220:
      case 230:
        {
          return 'SW';
        }
      case 240:
      case 250:
        {
          return 'W/SW';
        }
      case 260:
      case 270:
      case 280:
        {
          return 'W';
        }
      case 290:
      case 300:
        {
          return 'W/NW';
        }
      case 310:
      case 320:
        {
          return 'NW';
        }
      case 330:
      case 340:
        {
          return 'N/NW';
        }
      default:
        {
          return '-';
        }
    }
  }
}
