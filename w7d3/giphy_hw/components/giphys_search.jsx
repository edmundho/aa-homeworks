import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange (e) {
    this.setState({ searchTerm: e.currentTarget.value });
    console.log('state is changing');
  }

  handleSubmit (e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
    console.log('giphys fetched');
  }

  render () {
    let { giphys } = this.props;

    return (
      <div>
        <form>
          <input onChange={this.handleChange} value={this.state.searchTerm} />
          <button type="submit" onClick={this.handleSubmit}>Search!</button>
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;