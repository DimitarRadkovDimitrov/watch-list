import React from 'react';
import {View, AppRegistry, ActivityIndicator, Image, Text, TouchableHighlight} from 'react-native';
import {ScrollView} from 'react-native-gesture-handler';
import {Query} from 'react-apollo';
import * as queries from '../graphQL/queries';

export default class RecordList extends React.Component
{
    constructor(props)
    {
        super(props);
    }

    imageOnClick = () => {
        console.log("ON CLICK");
    };
    
    render()
    {
        return(
            <Query query={queries[this.props.queryName]}>
            {
                ({loading, error, data}) => {
                    if (loading)
                    {
                        return(
                            <View style={{flex: 1, padding: 20}}>
                                <ActivityIndicator/>
                            </View>
                        );
                    }
                    if (error)
                    {
                        return(
                            <View>
                                <Text>{error.message}</Text>
                            </View>
                        );
                    }

                    return(
                        <View>
                            <Text>{this.props.header}</Text>
                            <ScrollView horizontal>
                            {
                                data[this.props.queryName].map((record) => {
                                    recordImgSrc = `https://image.tmdb.org/t/p/w92${record.poster_path}`;
                                    return(
                                        <TouchableHighlight key={record.id} onPress={this.imageOnClick}>
                                            <Image source={{uri: recordImgSrc, width: 90, height: 125}} />
                                        </TouchableHighlight>     
                                    );
                                })
                            }       
                            </ScrollView>
                        </View>  
                    );
                }
            }
            </Query>
        );
    }
}

AppRegistry.registerComponent("RecordList", () => RecordList);
