import React from 'react';
import ReactDOM from 'react-dom';
import SongCard2 from './SongCard2';

it('It should mount', () => {
    const div = document.createElement('div');
    ReactDOM.render(<SongCard2/>, div);
    ReactDOM.unmountComponentAtNode(div);
});
