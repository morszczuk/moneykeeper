class IncomeElem extends React.Component {
  carrierIcons(carrier) {
    if (carrier == "cash")
      return "💵 ";
    if (carrier == "card")
      return '💳 ';
  }
  
  render() {
    const id = "income-heading-" + this.props.income.id
    const collapseHref = "#income-collapse-" + this.props.income.id
    const deleteHref = "/budget_plans/" + this.props.income.budget_plan_id + "/budget_incomes/" + this.props.income.id
    const marginBottom = {
      marginTop: "20px"
    }
    console.log(this.props.income.carrier);
    var carrierIcon = this.carrierIcons(this.props.income.carrier)
    console.log(carrierIcon);
    return (
      <a className="panel-heading collapsed" role="tab" id={id} style={marginBottom} data-parent= "#accordion" href={collapseHref} data-toggle="collapse" aria-expanded="false" aria-controls="collapseOne">
        <h4 className="panel-title">
          <div className="pull-left">
            {this.props.income.amount} {carrierIcon} {this.props.income.description}
          </div>
          <div className="pull-right">
            <a className="btn-sm btn-danger" rel="nofollow" data-method="delete" href={deleteHref}>
              <i className="fa fa-close"/>
            </a>
          </div>
          <div className="clearfix"/>
        </h4>
      </a>
    )
  }
}