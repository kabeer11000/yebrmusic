import _Link from "@material-ui/core/Link";
import {withRouter} from "react-router-dom";
import Link from "../components/Link";

const ExtendedLink = ({to, children, location}) => <_Link component={Link} to={{
    pathname: to,
    search: location.search
}}>{children}</_Link>;

export default withRouter(ExtendedLink);
