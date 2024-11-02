import { useState, useEffect } from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { multiply, revertString } from 'final_library_1';

export default function App() {
  const [result, setResult] = useState<number | undefined>();
  const [reverse, setReverse] = useState<string>('');

  useEffect(() => {
    multiply(3, 7).then(setResult);
    revertString('Reverse Me').then(setReverse);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Multiply: {result}</Text>
      <Text>Reverse: {reverse}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
