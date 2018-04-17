class GaugeElem extends React.Component {
  gaugeOpts() {
    return {
		  lines: 12,
		  angle: 0,
		  lineWidth: 0.1,
		  pointer: {
			  length: 0.75,
			  strokeWidth: 0.042,
			  color: '#1D212A'
		  },
		  limitMax: 'false',
		  colorStart: '#1ABC9C',
		  colorStop: '#1ABC9C',
		  strokeColor: '#F0F3F3',
		  generateGradient: true
	  };
  }

  componentDidMount() {
    if ($('#' + this.props.idName).length){
			var gauge_elem = document.getElementById(this.props.idName);
			var gauge = new Gauge(gauge_elem).setOptions(this.gaugeOpts());

      gauge.maxValue = this.props.maxValue;
      gauge.animationSpeed = 32;
      console.log(gauge);
      console.log(this.props.actualValue);
      gauge.set(this.props.actualValue);
      console.log("No tutaj powinno się włączyć")
    }
  }
  
  render() {
    return (
      <div className="sidebar-widget">
        <h4>Budget planning progress</h4>
        <canvas width="300" height="160" id={this.props.idName}/>
        <div className="goal-wrapper">
          <span  className="gauge-value pull-left" >
            {this.props.actualValue} zł
          </span>
          <span className="gauge-value pull-right">
            {this.props.maxValue} zł
          </span>
        </div>
      </div>
    )
  }
}