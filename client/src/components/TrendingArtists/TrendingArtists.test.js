import React from 'react';
import ReactDOM from 'react-dom';
import TrendingArtists from './TrendingArtists';

it('It should mount', () => {
    const div = document.createElement('div');
    ReactDOM.render(<TrendingArtists/>, div);
    ReactDOM.unmountComponentAtNode(div);
});
