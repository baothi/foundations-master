var ModelStageImage = React.createClass({
   // when a file is passed to the input field, retrieve the contents as a
  // base64-encoded data URI and save it to the component's state
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
    return (
      <div className="model-object-image-wrapper pull-right">
        <img className="thumbnail" ref="targetImg" src={this.props.stage.imageUrl || "/img/not-available.gif"} />
        <input className="model-stage-image hidden" ref="fileInput" type="file" accept="image/*" onChange={this.onChange} />
      </div>
    );
  }

});