import React from "react";
import {IconButton, Tooltip} from "@material-ui/core";
import FeedbackIcon from "@material-ui/icons/Feedback";
import {FeedbackDialog} from "mui-feedback-dialog";
import {comLinkWorker} from "../../functions/Worker/worker-export";
import {Device} from "../../functions/Device";


const FeedbackButton = () => {
    const [dialogVisible, setDialogVisible] = React.useState(false);
    // const {enqueueSnackbar} = useSnackbar();

    return <React.Fragment>
        <Tooltip title='Send Feedback' arrow>
            <IconButton onClick={() => setDialogVisible(true)}>
                <FeedbackIcon/>
            </IconButton>
        </Tooltip>
        <AbstractFeedbackDialog open={dialogVisible}
                                onClose={() => setDialogVisible(false)}
        />
    </React.Fragment>;
};
export const AbstractFeedbackDialog = ({
                                           open, onClose = () => {
    }, onSubmit = () => {
    }
                                       }) => (
    <FeedbackDialog
        open={open}
        onClose={onClose}
        onSubmit={async (res) => await fetch(`https://docs.kabeercloud.tk/yebr/feedback/s/`, {
            method: "POST",
            body: await comLinkWorker.JSON.stringify({
                app: {
                    version: window.__kn.music.version,
                    u: window.__kn.music.auth.authUser,
                    account: {
                        "signed_in": window.__kn.music.auth.user?.signed_in,
                        "username": window.__kn.music.auth.user?.username,
                        "name": window.__kn.music.auth.user?.name,
                        "account_image": window.__kn.music.auth.user?.account_image,
                        "user_id": window.__kn.music.auth.user?.user_id,
                        "email": window.__kn.music.auth.user?.email,
                        "verified": window.__kn.music.auth.user?.verified
                    },
                    debugging_enabled: window.__kn.music.developers["debugging-enabled"],
                    debugger_version: window.__kn.music.debugger_version,
                    internals: window.__kn.music.internals,
                    ts: new Date().toJSON(),
                    loc: window.location.href,
                },
                resolutions: {
                    current: await Device.fp.client.getCurrentResolution(),
                    all: await Device.fp.client.getAvailableResolution()
                },
                color_depth: await Device.fp.client.getColorDepth(),
                browser_info: await Device.fp.client.getBrowserData(),
                fp_variation: await Device.fp.client.getFingerprint(),
                u_data: res
            })
        }) && onSubmit()}/>
)
export default React.memo(FeedbackButton);
