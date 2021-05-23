using System;
using System.Threading.Tasks;
using Windows.ApplicationModel.Activation;
using Windows.UI.Notifications;
using Windows.UI.Xaml;
using Microsoft.Services.Store.Engagement;

namespace PengwinUI
{
    /// <summary>
    ///     Provides application-specific behavior to supplement the default Application class.
    /// </summary>
    sealed partial class App : Application
    {
        /// <summary>
        ///     Initializes the singleton application object.  This is the first line of authored code
        ///     executed, and as such is the logical equivalent of main() or WinMain().
        /// </summary>
        public App()
        {
            InitializeComponent();
        }

        protected override async void OnActivated(IActivatedEventArgs args)
        {
            base.OnActivated(args);

            if (args.Kind == ActivationKind.Protocol)
            {
                await SetupPushNotifications();
                Exit();
            }
        }

        private static async Task SetupPushNotifications()
        {
            var engagementManager = StoreServicesEngagementManager.GetDefault();
            if (engagementManager != null)
            {
                await engagementManager.RegisterNotificationChannelAsync();
            }
        }

        protected override void OnBackgroundActivated(BackgroundActivatedEventArgs args)
        {
            base.OnBackgroundActivated(args);

            // ReSharper disable once ConvertIfStatementToSwitchStatement
            if (args.TaskInstance.TriggerDetails is ToastNotificationActionTriggerDetail toastActivationArgs)
            {
                var engagementManager = StoreServicesEngagementManager.GetDefault();
                var originalArgs = engagementManager?.ParseArgumentsAndTrackAppLaunch(
                    toastActivationArgs.Argument);

                // Use the originalArgs variable to access the original arguments
                // that were passed to the app.
            }
        }
    }
}