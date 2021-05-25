var ModelStagesComponent = React.createClass({
  componentDidMount() {
    console.log(Routes);
    Foundations.App.init();

  },

  render() {

    return (
      <div className="panel panel-default">
        <PanelHeading/>
        <div className="panel-body no-padding-top">
          <table className="table table-striped model-stages">
            <tbody>
              {this.props.stages.map(function(stage) {
                return <ModelStageRow stage={stage} key={stage.id} />;
              })}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
});

var ModelStageRow = React.createClass({
  // when a file is passed to the input field, retrieve the contents as a
  // base64-encoded data URI and save it to the component's state
  selectFile(e) {
    e.preventDefault();
    var fileInput = this.refs.fileInput;
    $(fileInput).trigger('click');
  },
  onChange(e) {
    e.preventDefault();
    var fileInput = this.refs.fileInput;
    var targeImg = this.refs.targetImg;

    if (fileInput.files.length > 0) {
      $(this.refs.imageLink).spin({color: '#009688' });
      var reader = new FileReader();
      // when image is loaded, set the src of the image where you want to display it
      reader.onload = function (e) {
        targeImg.src = this.result;
      };
      reader.readAsDataURL(fileInput.files[0]);

      $('.spinner').remove();
    }
  },

  render() {

    var stage = this.props.stage;
    console.log(stage);
    return (
      <tr>
        <td className="text-left no-padding" width="30">
          <input type="checkbox" className="checkbox checkbox-primary" />
        </td>
        <td width="70%"><h4 className="no-padding">Stage Name</h4></td>
        <td>
          <div className="model-object-image-wrapper pull-right">
            <img className="thumbnail" ref="targetImg" src={stage.imageUrl || "/img/not-available.gif"} />
            <input className="model-stage-image" ref="fileInput" className="hidden" type="file" accept="image/*" onChange={this.onChange} />
          </div>
        </td>
        <td>
          <button onClick={this.selectFile} className="secondary-container btn btn-default btn-icon-toggle materialRipple-light materialRipple-btn" type="button">
            <i className="material-icons">add_a_photo</i>
          </button>
        </td>
      </tr>
    )
  }
});

var PanelHeading = React.createClass({
  render() {
    return (
      <div className="panel-heading">
        <header>Model Stages</header>
        <div className="panel-heading-tools">
          <a href={Routes.stages_path()} className="btn btn-primary btn-block btn-flat btn-sm">Manage Stages</a>
        </div>
      </div>
    );
  }
});