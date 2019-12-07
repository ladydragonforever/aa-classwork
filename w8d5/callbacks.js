class Clock {
    constructor() {
      // 1. Create a Date object.
        let date = new Date();
      // 2. Store the hours, minutes, and seconds.
        this.time = new Array(3);
        this.time[0] = date.getHours();
        this.time[1] = date.getMinutes();
        this.time[2] = date.getSeconds();
      // 3. Call printTime.

        this.printTime();
      // 4. Schedule the tick at 1 second intervals.

        setInterval(this._tick.bind(this), 3000);
    }

    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
    //   let newArr = new Array(3);
    //   for(let i = 0; i < 3; i++) {
    //     if(this.time[i] < 10) {
    //         newArr[i] = [0].concat([this.time[i]]);
    //     }
    //     else {
    //         newArr[i] = this.time[i]);
    //     }
    //   }

      console.log(this.time.join(":"));
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      let seconds = this.time[2] + 1;
      let minutes = this.time[1];
      let hours = this.time[0];

      if(seconds >= 60) {
          seconds = 0;
          minutes += 1;
      }

      if(minutes >= 60) {
          minutes = 0;
          hours += 1;
      }

      if(hours >= 24) {
          seconds = 0;
          minutes = 0;
          hours = 0;
      }

      this.time[2] = seconds;
      this.time[1] = minutes;
      this.time[0] = hours;
      this.printTime();
    }
  }
  
  const clock = new Clock();