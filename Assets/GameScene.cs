using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameScene : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        print("game scene start!");
        this.GetComponent<Button>().onClick.AddListener(() =>
        {
            StartCoroutine(this.backToMain());
        });

//         StartCoroutine(this.releaseMain());
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    IEnumerator backToMain()
    {
        var scene = SceneManager.LoadSceneAsync("Main");
        yield return scene;
    }

    IEnumerator releaseMain()
    {
        var scene = SceneManager.UnloadSceneAsync("Main");
        yield return scene;
    }
}
