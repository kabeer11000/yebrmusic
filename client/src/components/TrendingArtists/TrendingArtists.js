import React from 'react';
import './TrendingArtists.css';
import {initAuth} from "../../functions/auth";
import {Container, IconButton} from "@material-ui/core";
import Divider from "@material-ui/core/Divider";
import Grow from "@material-ui/core/Grow";
import Typography from "@material-ui/core/Typography";
import SongCard2 from "../SongCard2/SongCard2";
import Grid from "@material-ui/core/Grid";
import {isTvContext, PlayContext} from "../../Contexts";
import {getSong} from "../../functions/songs";
import endPoints from "../../api/endpoints/endpoints";
import {comLinkWorker as comlinkWorker} from "../../functions/Worker/worker-export";
import SongCard from "../SongCard/SongCard";
import Avatar from "@material-ui/core/Avatar";
import {Link} from "react-router-dom";
import {get, set} from "idb-keyval";
import {storageIndex} from "../../functions/Helper/storageIndex";


// Trending PL-DfNcB3lim9L-rrvhrR3AoFB9Sa-KoxW
const TrendingArtists = () => {
    const [state, setState] = React.useState(null);
    const [error, setError] = React.useState(false);

    React.useEffect(() => {
        const b = async () => comlinkWorker.fetch(endPoints.getTrendingArtistsRanked, {
            headers: {"Authorization": `Bearer ${await initAuth()}`}
        });
        const a = async () => {
            try {
                if (!await get(storageIndex.trendingArtists.saveObject) || !(Date.now() - await get(storageIndex.trendingArtists.timeObject)) / (100 * 60) > 1) {
                    setState(await b());
                } else setState(await get(storageIndex.trendingArtists.saveObject));
            } catch (e) {
                setError(!error);
            }
        };
        a();
    }, []);
    React.useEffect(() => {
        const a = async () => {
            if (!state) return;
            const saved = await get(storageIndex.trendingArtists.saveObject);
            if (!saved || saved.etag !== state.etag) {
                await set(storageIndex.trendingArtists.timeObject, Date.now());
                await set(storageIndex.trendingArtists.saveObject, state);
            }
        };
        a();
    }, [state]);
    const {PlaySong} = React.useContext(PlayContext);
    const isTv = React.useContext(isTvContext);

    return (
        <div className="TrendingArtists">
            <div className="Discover" style={{
                marginTop: "5rem",
                marginBottom: "3rem"
            }}>
                {state && state.artists ? state.artists.map((artist, playListIndex) => <React.Fragment
                    key={playListIndex}>
                    <Grow in={true}>
                        <Typography variant={"h5"} className={"mb-3 mt-2 pl-3 text-left text-truncate"}>
                            {artist.title} {artist.accounts[0] && <IconButton component={Link}
                                                                              to={`/artist?id=${artist.accounts[0].url.split("/").pop()}`}><Avatar
                            src={artist.accounts[0].image}/></IconButton>}
                        </Typography>
                    </Grow>
                    <Container maxWidth="xl" className={"mb-0 pb-0"}>
                        {isTv ? <Grid container spacing={2}>
                            {artist.items.slice(0, 4).map((song, index) => (
                                <Grid key={index} item xs={6} sm={6} md={4} xl={3} lg={3}>
                                    <SongCard
                                        song={artist.items[index]}
                                        onClick={async () => {
                                            const song = artist.items[index]
                                            await PlaySong({
                                                useProxy: true,
                                                songURI: await getSong(song.id),
                                                song: song,
                                                playList: {
                                                    list: artist,
                                                    index: index
                                                }
                                            });
                                        }}
                                        playlist={true}/>
                                </Grid>
                            ))}
                        </Grid> : <Grid container spacing={2}>
                            {artist.items.slice(0, 4).map((song, index) => (
                                <Grid key={index}
                                      item xs={6}
                                      sm={2}>
                                    <SongCard2
                                        video={artist.items[index]}
                                        onPlay={async () => {
                                            const song = artist.items[index]
                                            await PlaySong({
                                                useProxy: true,
                                                songURI: await getSong(song.id),
                                                song: song,
                                                playList: {
                                                    list: artist,
                                                    index: index
                                                }
                                            });
                                        }}
                                        playlist={true}/>
                                </Grid>
                            ))}
                        </Grid>}
                    </Container>
                    <Divider/>
                </React.Fragment>) : null
                }
                {error ? <div className="Preloader text-center" style={{
                    width: "10rem",
                    height: "10rem",
                    position: "absolute",
                    top: "50%",
                    left: "50%",
                    transform: "translate(-50%, -50%)"
                }}>
                    <img src={"./assets/icons/darkmode_nothingfound.svg"} style={{width: "8rem", height: "auto"}}
                         alt={"Kabeers Music Logo"}/>

                </div> : null}

                {/*<Grid container spacing={2}>*/}
                {/*    {state && state.artists ? state.artists.map((artist, index) => <Grid key={index} item xs={6}*/}
                {/*                                                                         sm={2}><SongCard2*/}
                {/*        video={artist.items[0]} onPlay={() => {*/}
                {/*    }} playlist={true}/></Grid>) : null}*/}
                {/*</Grid>*/}
            </div>
        </div>
    );
}

TrendingArtists.propTypes = {};

TrendingArtists.defaultProps = {};

export default TrendingArtists;
