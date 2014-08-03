Gamify
======
[![Build Status](https://travis-ci.org/haaakon/Gamify.svg?branch=master)](https://travis-ci.org/haaakon/Gamify)

The simplest way of adding gamification to your app!

##Features:
- Score view with animations for adding/subtracting score
- Persisently stores the main players score 
- Easy to set up achievements which can be triggered whenever you want


![Gamify example](https://raw.githubusercontent.com/haaakon/Gamify/master/readme-files/gamify-example.gif)

## Main Classes


### AAAScoreView 
![Score view](https://raw.githubusercontent.com/haaakon/Gamify/master/readme-files/scoreview.gif)

A customizeable view with a label that represents a score. When the score of the view is changed, a second label
will appear briefly floating above the score label indicating the change in score.

### AAAGamificationManager
Persisently keeps track of the main players score. If you set a score view for it, it will automatically update 
that score view whenever the main players score changes

### AAAAchievementManager 
Can show achievements modally from any location in your app. 


##Example code

### Add to score
First chose a score view that will update when the main players score changes. Then add to main players score.
```
[[AAAGamificationManager sharedManager] setScoreView:self.scoreView];
[[AAAGamificationManager sharedManager] addToMainPlayerScore:pointsToAdd];
```

###Set score
Sets the score to the given NSInteger, will calculate the change and animate it floating over the scoreview
```objective-c
NSInteger scoreToSet = self.addScoreTextField.text.integerValue;
[[AAAGamificationManager sharedManager] setMainPlayersScore:scoreToSet];
```

### Trigger achievement viewer
Shows a modal view of the achievement view controller on top of the view controller given in the argument. The achievement key is gotten from the achievement data source.
```
[[AAAAchievementManager sharedManager] showAchievementViewControllerOnViewController:self
achievementKey:kForestStarAchievementKey];

// Achievement DataSource
- (AAAAchievement *)achievementForKey:(NSString *)key
{
    if ([key isEqualToString:kForestStarAchievementKey]) {
        AAAAchievement *achievement = [[AAAAchievement alloc] initWitTitleText:NSLocalizedString(@"Forest star", @"") descriptionText:NSLocalizedString(@"All forest star questions mastered. Congratulations", @"") image:[UIImage imageNamed:@"forest"]];
        return achievement;
}

```




#TODO
- Achievement list


## License
MIT
