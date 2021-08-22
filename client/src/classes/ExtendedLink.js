import Link from "@material-ui/core/Link";

const ExtendedLink = ({to, children, location}) => <Link to={{
    pathname: to,
    search: location.search
}}>{children}</Link>

export default withRouter(ExtendedLink)
