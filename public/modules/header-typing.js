class Typing {
  constructor(header) {
    this.header = header;
    this.complete = false;
    this.charIndex = 0;
    this.waitTime = 0;
    this.typedString = "";
    this.cursor = "|";
  }

  type() {
    if (!this.complete) {
      this.charIndex++;
      this.typedString = this.header.slice(0, this.charIndex);
      if (this.typedString === this.header) this.complete = true;
    } else {
      this.waitTime++;
      if (this.waitTime === 5) {
        this.cursor = this.cursor === "|" ? " " : "|";
        this.waitTime = 0;
      }
    }
  }
}

const headerTyping = new Typing("Hilman's Project Inventory");

export default headerTyping;
