.class public Lcom/android/gallery3d/app/StateManager;
.super Ljava/lang/Object;
.source "StateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/gallery3d/app/StateManager$StateEntry;
    }
.end annotation


# instance fields
.field private mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

.field private mIsResumed:Z

.field private mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

.field private mStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/android/gallery3d/app/StateManager$StateEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/app/AbstractGalleryActivity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    .line 43
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    .line 47
    iput-object p1, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    .line 48
    return-void
.end method


# virtual methods
.method public clearActivityResult()V
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 156
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->clearStateResult()V

    .line 158
    :cond_0
    return-void
.end method

.method public clearTasks()V
    .locals 2

    .prologue
    .line 189
    :goto_0
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 190
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v0, v0, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->onDestroy()V

    goto :goto_0

    .line 192
    :cond_0
    return-void
.end method

.method public createOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    const/4 v0, 0x0

    .line 128
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/app/ActivityState;->onCreateActionBar(Landroid/view/Menu;)Z

    move-result v0

    goto :goto_0
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 271
    const-string v0, "StateManager"

    const-string v1, "destroy"

    invoke-static {v0, v1}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    :goto_0
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v0, v0, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->onDestroy()V

    goto :goto_0

    .line 275
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 276
    return-void
.end method

.method finishState(Lcom/android/gallery3d/app/ActivityState;)V
    .locals 1
    .parameter "state"

    .prologue
    .line 184
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/gallery3d/app/StateManager;->finishState(Lcom/android/gallery3d/app/ActivityState;Z)V

    .line 185
    return-void
.end method

.method finishState(Lcom/android/gallery3d/app/ActivityState;Z)V
    .locals 7
    .parameter "state"
    .parameter "fireOnPause"

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x1

    .line 197
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v2

    if-ne v2, v6, :cond_3

    .line 198
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v2}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 199
    .local v0, activity:Landroid/app/Activity;
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    if-eqz v2, :cond_0

    .line 200
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    iget v2, v2, Lcom/android/gallery3d/app/ActivityState$ResultEntry;->resultCode:I

    iget-object v4, p0, Lcom/android/gallery3d/app/StateManager;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    iget-object v4, v4, Lcom/android/gallery3d/app/ActivityState$ResultEntry;->resultData:Landroid/content/Intent;

    invoke-virtual {v0, v2, v4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 202
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 203
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_2

    .line 204
    const-string v2, "StateManager"

    const-string v3, "finish is rejected, keep the last state"

    invoke-static {v2, v3}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    .end local v0           #activity:Landroid/app/Activity;
    :cond_1
    :goto_0
    return-void

    .line 207
    .restart local v0       #activity:Landroid/app/Activity;
    :cond_2
    const-string v2, "StateManager"

    const-string v4, "no more state, finish activity"

    invoke-static {v2, v4}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    .end local v0           #activity:Landroid/app/Activity;
    :cond_3
    const-string v2, "StateManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "finishState "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v2, v2, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    if-eq p1, v2, :cond_5

    .line 212
    invoke-virtual {p1}, Lcom/android/gallery3d/app/ActivityState;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 213
    const-string v2, "StateManager"

    const-string v3, "The state is already destroyed"

    invoke-static {v2, v3}, Lcom/android/gallery3d/app/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 216
    :cond_4
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The stateview to be finished is not at the top of the stack: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v2, v2, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 223
    :cond_5
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 224
    iput-boolean v6, p1, Lcom/android/gallery3d/app/ActivityState;->mIsFinishing:Z

    .line 225
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_8

    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v1, v2, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    .line 226
    .local v1, top:Lcom/android/gallery3d/app/ActivityState;
    :goto_1
    iget-boolean v2, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v2, :cond_7

    if-eqz p2, :cond_7

    .line 227
    if-eqz v1, :cond_6

    .line 228
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;->Outgoing:Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;

    invoke-virtual {p1, v2, v4, v5}, Lcom/android/gallery3d/app/ActivityState;->transitionOnNextPause(Ljava/lang/Class;Ljava/lang/Class;Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;)V

    .line 231
    :cond_6
    invoke-virtual {p1}, Lcom/android/gallery3d/app/ActivityState;->onPause()V

    .line 233
    :cond_7
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v2}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->getGLRoot()Lcom/android/gallery3d/ui/GLRoot;

    move-result-object v2

    invoke-interface {v2, v3}, Lcom/android/gallery3d/ui/GLRoot;->setContentPane(Lcom/android/gallery3d/ui/GLView;)V

    .line 234
    invoke-virtual {p1}, Lcom/android/gallery3d/app/ActivityState;->onDestroy()V

    .line 236
    if-eqz v1, :cond_1

    iget-boolean v2, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lcom/android/gallery3d/app/ActivityState;->resume()V

    goto/16 :goto_0

    .end local v1           #top:Lcom/android/gallery3d/app/ActivityState;
    :cond_8
    move-object v1, v3

    .line 225
    goto :goto_1
.end method

.method public getStateCount()I
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    return v0
.end method

.method public getTopState()Lcom/android/gallery3d/app/ActivityState;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/common/Utils;->assertTrue(Z)V

    .line 332
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v0, v0, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    return-object v0

    .line 331
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasStateClass(Ljava/lang/Class;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/android/gallery3d/app/ActivityState;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 322
    .local p1, klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/app/StateManager$StateEntry;

    .line 323
    .local v0, entry:Lcom/android/gallery3d/app/StateManager$StateEntry;
    iget-object v2, v0, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 324
    const/4 v2, 0x1

    .line 327
    .end local v0           #entry:Lcom/android/gallery3d/app/StateManager$StateEntry;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public itemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    const/4 v0, 0x1

    .line 165
    iget-object v1, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 166
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/gallery3d/app/ActivityState;->onItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 174
    :cond_0
    :goto_0
    return v0

    .line 167
    :cond_1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x102002c

    if-ne v1, v2, :cond_2

    .line 168
    iget-object v1, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-le v1, v0, :cond_0

    .line 169
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/gallery3d/app/ActivityState;->onBackPressed()V

    goto :goto_0

    .line 174
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notifyActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/gallery3d/app/ActivityState;->onStateResult(IILandroid/content/Intent;)V

    .line 152
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->onBackPressed()V

    .line 181
    :cond_0
    return-void
.end method

.method public onConfigurationChange(Landroid/content/res/Configuration;)V
    .locals 3
    .parameter "config"

    .prologue
    .line 133
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/app/StateManager$StateEntry;

    .line 134
    .local v0, entry:Lcom/android/gallery3d/app/StateManager$StateEntry;
    iget-object v2, v0, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v2, p1}, Lcom/android/gallery3d/app/ActivityState;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 136
    .end local v0           #entry:Lcom/android/gallery3d/app/StateManager$StateEntry;
    :cond_0
    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-nez v0, :cond_1

    .line 148
    :cond_0
    :goto_0
    return-void

    .line 146
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    .line 147
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->onPause()V

    goto :goto_0
.end method

.method public restoreFromState(Landroid/os/Bundle;)V
    .locals 14
    .parameter "inState"

    .prologue
    .line 280
    const-string v11, "StateManager"

    const-string v12, "restoreFromState"

    invoke-static {v11, v12}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    const-string v11, "activity-state"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v8

    .line 282
    .local v8, list:[Landroid/os/Parcelable;
    move-object v1, v8

    .local v1, arr$:[Landroid/os/Parcelable;
    array-length v7, v1

    .local v7, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v9, v1, v5

    .local v9, parcelable:Landroid/os/Parcelable;
    move-object v2, v9

    .line 283
    check-cast v2, Landroid/os/Bundle;

    .line 284
    .local v2, bundle:Landroid/os/Bundle;
    const-string v11, "class"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    .line 287
    .local v6, klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    const-string v11, "data"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    .line 288
    .local v3, data:Landroid/os/Bundle;
    const-string v11, "bundle"

    invoke-virtual {v2, v11}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v10

    .line 292
    .local v10, state:Landroid/os/Bundle;
    :try_start_0
    const-string v11, "StateManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "restoreFromState "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/app/ActivityState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    .local v0, activityState:Lcom/android/gallery3d/app/ActivityState;
    iget-object v11, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v0, v11, v3}, Lcom/android/gallery3d/app/ActivityState;->initialize(Lcom/android/gallery3d/app/AbstractGalleryActivity;Landroid/os/Bundle;)V

    .line 298
    invoke-virtual {v0, v3, v10}, Lcom/android/gallery3d/app/ActivityState;->onCreate(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 299
    iget-object v11, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    new-instance v12, Lcom/android/gallery3d/app/StateManager$StateEntry;

    invoke-direct {v12, v3, v0}, Lcom/android/gallery3d/app/StateManager$StateEntry;-><init>(Landroid/os/Bundle;Lcom/android/gallery3d/app/ActivityState;)V

    invoke-virtual {v11, v12}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 294
    .end local v0           #activityState:Lcom/android/gallery3d/app/ActivityState;
    :catch_0
    move-exception v4

    .line 295
    .local v4, e:Ljava/lang/Exception;
    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v11

    .line 301
    .end local v2           #bundle:Landroid/os/Bundle;
    .end local v3           #data:Landroid/os/Bundle;
    .end local v4           #e:Ljava/lang/Exception;
    .end local v6           #klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    .end local v9           #parcelable:Landroid/os/Parcelable;
    .end local v10           #state:Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v0, :cond_1

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 140
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    .line 141
    iget-object v0, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->resume()V

    goto :goto_0
.end method

.method public saveState(Landroid/os/Bundle;)V
    .locals 10
    .parameter "outState"

    .prologue
    .line 304
    const-string v7, "StateManager"

    const-string v8, "saveState"

    invoke-static {v7, v8}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    iget-object v7, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v7

    new-array v5, v7, [Landroid/os/Parcelable;

    .line 307
    .local v5, list:[Landroid/os/Parcelable;
    const/4 v2, 0x0

    .line 308
    .local v2, i:I
    iget-object v7, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/gallery3d/app/StateManager$StateEntry;

    .line 309
    .local v1, entry:Lcom/android/gallery3d/app/StateManager$StateEntry;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 310
    .local v0, bundle:Landroid/os/Bundle;
    const-string v7, "class"

    iget-object v8, v1, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 311
    const-string v7, "data"

    iget-object v8, v1, Lcom/android/gallery3d/app/StateManager$StateEntry;->data:Landroid/os/Bundle;

    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 312
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 313
    .local v6, state:Landroid/os/Bundle;
    iget-object v7, v1, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v7, v6}, Lcom/android/gallery3d/app/ActivityState;->onSaveState(Landroid/os/Bundle;)V

    .line 314
    const-string v7, "bundle"

    invoke-virtual {v0, v7, v6}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 315
    const-string v7, "StateManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "saveState "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v1, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    add-int/lit8 v3, v2, 0x1

    .end local v2           #i:I
    .local v3, i:I
    aput-object v0, v5, v2

    move v2, v3

    .line 317
    .end local v3           #i:I
    .restart local v2       #i:I
    goto :goto_0

    .line 318
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v1           #entry:Lcom/android/gallery3d/app/StateManager$StateEntry;
    .end local v6           #state:Landroid/os/Bundle;
    :cond_0
    const-string v7, "activity-state"

    invoke-virtual {p1, v7, v5}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 319
    return-void
.end method

.method public startState(Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 6
    .parameter
    .parameter "data"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/android/gallery3d/app/ActivityState;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    const-string v3, "StateManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startState "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/4 v1, 0x0

    .line 55
    .local v1, state:Lcom/android/gallery3d/app/ActivityState;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1           #state:Lcom/android/gallery3d/app/ActivityState;
    check-cast v1, Lcom/android/gallery3d/app/ActivityState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .restart local v1       #state:Lcom/android/gallery3d/app/ActivityState;
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 60
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v2

    .line 61
    .local v2, top:Lcom/android/gallery3d/app/ActivityState;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    sget-object v4, Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;->Incoming:Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;

    invoke-virtual {v2, v3, p1, v4}, Lcom/android/gallery3d/app/ActivityState;->transitionOnNextPause(Ljava/lang/Class;Ljava/lang/Class;Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;)V

    .line 63
    iget-boolean v3, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/android/gallery3d/app/ActivityState;->onPause()V

    .line 65
    .end local v2           #top:Lcom/android/gallery3d/app/ActivityState;
    :cond_0
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v1, v3, p2}, Lcom/android/gallery3d/app/ActivityState;->initialize(Lcom/android/gallery3d/app/AbstractGalleryActivity;Landroid/os/Bundle;)V

    .line 67
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    new-instance v4, Lcom/android/gallery3d/app/StateManager$StateEntry;

    invoke-direct {v4, p2, v1}, Lcom/android/gallery3d/app/StateManager$StateEntry;-><init>(Landroid/os/Bundle;Lcom/android/gallery3d/app/ActivityState;)V

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const/4 v3, 0x0

    invoke-virtual {v1, p2, v3}, Lcom/android/gallery3d/app/ActivityState;->onCreate(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 69
    iget-boolean v3, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Lcom/android/gallery3d/app/ActivityState;->resume()V

    .line 70
    :cond_1
    return-void

    .line 56
    .end local v1           #state:Lcom/android/gallery3d/app/ActivityState;
    :catch_0
    move-exception v0

    .line 57
    .local v0, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public startStateForResult(Ljava/lang/Class;ILandroid/os/Bundle;)V
    .locals 6
    .parameter
    .parameter "requestCode"
    .parameter "data"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/android/gallery3d/app/ActivityState;",
            ">;I",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    const-string v3, "StateManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startStateForResult "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    const/4 v2, 0x0

    .line 101
    .local v2, state:Lcom/android/gallery3d/app/ActivityState;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    .end local v2           #state:Lcom/android/gallery3d/app/ActivityState;
    check-cast v2, Lcom/android/gallery3d/app/ActivityState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .restart local v2       #state:Lcom/android/gallery3d/app/ActivityState;
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v2, v3, p3}, Lcom/android/gallery3d/app/ActivityState;->initialize(Lcom/android/gallery3d/app/AbstractGalleryActivity;Landroid/os/Bundle;)V

    .line 106
    new-instance v3, Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    invoke-direct {v3}, Lcom/android/gallery3d/app/ActivityState$ResultEntry;-><init>()V

    iput-object v3, v2, Lcom/android/gallery3d/app/ActivityState;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    .line 107
    iget-object v3, v2, Lcom/android/gallery3d/app/ActivityState;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    iput p2, v3, Lcom/android/gallery3d/app/ActivityState$ResultEntry;->requestCode:I

    .line 109
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 110
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v0

    .line 111
    .local v0, as:Lcom/android/gallery3d/app/ActivityState;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    sget-object v4, Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;->Incoming:Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;

    invoke-virtual {v0, v3, p1, v4}, Lcom/android/gallery3d/app/ActivityState;->transitionOnNextPause(Ljava/lang/Class;Ljava/lang/Class;Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;)V

    .line 113
    iget-object v3, v2, Lcom/android/gallery3d/app/ActivityState;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    iput-object v3, v0, Lcom/android/gallery3d/app/ActivityState;->mReceivedResults:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    .line 114
    iget-boolean v3, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/android/gallery3d/app/ActivityState;->onPause()V

    .line 119
    .end local v0           #as:Lcom/android/gallery3d/app/ActivityState;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    new-instance v4, Lcom/android/gallery3d/app/StateManager$StateEntry;

    invoke-direct {v4, p3, v2}, Lcom/android/gallery3d/app/StateManager$StateEntry;-><init>(Landroid/os/Bundle;Lcom/android/gallery3d/app/ActivityState;)V

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const/4 v3, 0x0

    invoke-virtual {v2, p3, v3}, Lcom/android/gallery3d/app/ActivityState;->onCreate(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 121
    iget-boolean v3, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/android/gallery3d/app/ActivityState;->resume()V

    .line 122
    :cond_1
    return-void

    .line 102
    .end local v2           #state:Lcom/android/gallery3d/app/ActivityState;
    :catch_0
    move-exception v1

    .line 103
    .local v1, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 116
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v2       #state:Lcom/android/gallery3d/app/ActivityState;
    :cond_2
    iget-object v3, v2, Lcom/android/gallery3d/app/ActivityState;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    iput-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mResult:Lcom/android/gallery3d/app/ActivityState$ResultEntry;

    goto :goto_0
.end method

.method public startStateNow(Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 6
    .parameter
    .parameter "data"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/android/gallery3d/app/ActivityState;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    const-string v3, "StateManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startStateNow "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    const/4 v1, 0x0

    .line 77
    .local v1, state:Lcom/android/gallery3d/app/ActivityState;
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1           #state:Lcom/android/gallery3d/app/ActivityState;
    check-cast v1, Lcom/android/gallery3d/app/ActivityState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .restart local v1       #state:Lcom/android/gallery3d/app/ActivityState;
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/android/gallery3d/app/StateManager;->getTopState()Lcom/android/gallery3d/app/ActivityState;

    move-result-object v2

    .line 83
    .local v2, top:Lcom/android/gallery3d/app/ActivityState;
    iget-boolean v3, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/android/gallery3d/app/ActivityState;->onPause()V

    .line 85
    .end local v2           #top:Lcom/android/gallery3d/app/ActivityState;
    :cond_0
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v1, v3, p2}, Lcom/android/gallery3d/app/ActivityState;->initialize(Lcom/android/gallery3d/app/AbstractGalleryActivity;Landroid/os/Bundle;)V

    .line 87
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 88
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 91
    :cond_1
    iget-object v3, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    new-instance v4, Lcom/android/gallery3d/app/StateManager$StateEntry;

    invoke-direct {v4, p2, v1}, Lcom/android/gallery3d/app/StateManager$StateEntry;-><init>(Landroid/os/Bundle;Lcom/android/gallery3d/app/ActivityState;)V

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const/4 v3, 0x0

    invoke-virtual {v1, p2, v3}, Lcom/android/gallery3d/app/ActivityState;->onCreate(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 93
    iget-boolean v3, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v3, :cond_2

    invoke-virtual {v1}, Lcom/android/gallery3d/app/ActivityState;->resume()V

    .line 94
    :cond_2
    return-void

    .line 78
    .end local v1           #state:Lcom/android/gallery3d/app/ActivityState;
    :catch_0
    move-exception v0

    .line 79
    .local v0, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public switchState(Lcom/android/gallery3d/app/ActivityState;Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 5
    .parameter "oldState"
    .parameter
    .parameter "data"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/gallery3d/app/ActivityState;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/android/gallery3d/app/ActivityState;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 241
    .local p2, klass:Ljava/lang/Class;,"Ljava/lang/Class<+Lcom/android/gallery3d/app/ActivityState;>;"
    const-string v2, "StateManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "switchState "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/gallery3d/app/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v2, v2, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    if-eq p1, v2, :cond_0

    .line 243
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The stateview to be finished is not at the top of the stack: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/app/StateManager$StateEntry;

    iget-object v2, v2, Lcom/android/gallery3d/app/StateManager$StateEntry;->activityState:Lcom/android/gallery3d/app/ActivityState;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 248
    :cond_0
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 249
    const-string v2, "app-bridge"

    invoke-virtual {p3, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 251
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    sget-object v3, Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;->Incoming:Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;

    invoke-virtual {p1, v2, p2, v3}, Lcom/android/gallery3d/app/ActivityState;->transitionOnNextPause(Ljava/lang/Class;Ljava/lang/Class;Lcom/android/gallery3d/anim/StateTransitionAnimation$Transition;)V

    .line 254
    :cond_1
    iget-boolean v2, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v2, :cond_2

    invoke-virtual {p1}, Lcom/android/gallery3d/app/ActivityState;->onPause()V

    .line 255
    :cond_2
    invoke-virtual {p1}, Lcom/android/gallery3d/app/ActivityState;->onDestroy()V

    .line 258
    const/4 v1, 0x0

    .line 260
    .local v1, state:Lcom/android/gallery3d/app/ActivityState;
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1           #state:Lcom/android/gallery3d/app/ActivityState;
    check-cast v1, Lcom/android/gallery3d/app/ActivityState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 264
    .restart local v1       #state:Lcom/android/gallery3d/app/ActivityState;
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mActivity:Lcom/android/gallery3d/app/AbstractGalleryActivity;

    invoke-virtual {v1, v2, p3}, Lcom/android/gallery3d/app/ActivityState;->initialize(Lcom/android/gallery3d/app/AbstractGalleryActivity;Landroid/os/Bundle;)V

    .line 265
    iget-object v2, p0, Lcom/android/gallery3d/app/StateManager;->mStack:Ljava/util/Stack;

    new-instance v3, Lcom/android/gallery3d/app/StateManager$StateEntry;

    invoke-direct {v3, p3, v1}, Lcom/android/gallery3d/app/StateManager$StateEntry;-><init>(Landroid/os/Bundle;Lcom/android/gallery3d/app/ActivityState;)V

    invoke-virtual {v2, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    const/4 v2, 0x0

    invoke-virtual {v1, p3, v2}, Lcom/android/gallery3d/app/ActivityState;->onCreate(Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 267
    iget-boolean v2, p0, Lcom/android/gallery3d/app/StateManager;->mIsResumed:Z

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/gallery3d/app/ActivityState;->resume()V

    .line 268
    :cond_3
    return-void

    .line 261
    .end local v1           #state:Lcom/android/gallery3d/app/ActivityState;
    :catch_0
    move-exception v0

    .line 262
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method
