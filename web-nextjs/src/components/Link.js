import React from "react";
import {NavLink, Link as NativeLink} from "react-router-dom";
import MUILink from "@material-ui/core/Link";

// import styled from "@material-ui/core/styles/styled";
// styled(MUILink)``;

const FancyLink = React.forwardRef((props, ref) => (
    <MUILink color="inherit" underline="none" style={{
        textDecoration: 'none'
    }} ref={ref} {...props}>{props.children}</MUILink>
));
export const Link = (props) => (
    <NativeLink {...props} component={FancyLink}/>
);
export default NativeLink;
