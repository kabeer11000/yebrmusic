import React from 'react';
import ReactDOM from 'react-dom';
import SongListItem from './SongListItem';

it('It should mount', () => {
    const div = document.createElement('div');
    ReactDOM.render(<SongListItem/>, div);
    ReactDOM.unmountComponentAtNode(div);
});
