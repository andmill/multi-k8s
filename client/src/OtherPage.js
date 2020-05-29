import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <div>
      <p>Im some other page!</p>
      <p><Link to="/">Go back home</Link></p>
    </div>
  );
};
