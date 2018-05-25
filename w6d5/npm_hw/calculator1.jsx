import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    if (e.target.value) {
      this.state.num1 = parseInt(e.target.value);
    } else {
      this.state.num1 = "";
    }
  }

  setNum2(e) {
    e.preventDefault();
    if (e.target.value) {
      this.state.num2 = parseInt(e.target.value);
    } else {
      this.state.num2 = "";
    }
  }
  
  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} type="text" value={this.state.num1} />
        <input onChange={this.setNum2} type="text" value={this.state.num2} />
      </div>
    );
  }
}

export default Calculator;

