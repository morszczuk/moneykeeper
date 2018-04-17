class SpendingElem extends React.Component {
  render() {
    const id = "spending-heading-" + this.props.spending.id
    const collapseHref = "#spending-collapse-" + this.props.spending.id
    const deleteHref = "/budget_plans/" + this.props.spending.budget_plan_id + "/budget_spendings/" + this.props.spending.id
    const marginBottom = {
      marginTop: "20px"
    }
    return (
      <a className="panel-heading collapsed blue-bg" role="tab" id={id} style={marginBottom} data-parent= "#accordion" href={collapseHref} data-toggle="collapse" aria-expanded="false" aria-controls="collapseOne">
        <h4 className="panel-title">
          <div className="pull-left">
            {this.props.category} - {this.props.spending.amount} zł
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