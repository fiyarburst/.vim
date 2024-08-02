import iterm2
import os
import sys


# split pane
async def main(connection):
    # check envvar $TERM non empty
    if os.environ.get('TERM') is None:
        return

    # check if theres a path argument
    if len(sys.argv) > 1:
        path = sys.argv[1]
        # validate directory
        if not os.path.isdir(path):
            return

    app = await iterm2.async_get_app(connection)
    window = app.current_window
    print(window)
    if window is not None:
        # Get the current session
        session = app.current_terminal_window.current_tab.current_session
        if path:
            # profile_customizations: Union[None, iterm2.profile.LocalWriteOnlyProfile] - add initial path
            profile_customizations = iterm2.LocalWriteOnlyProfile()
            profile_customizations.set_advanced_working_directory_pane_directory(path)
        else:
            profile_customizations = None


        # Create a new split pane
        new_session = await session.async_split_pane(
                vertical=True, 
                profile_customizations=profile_customizations)
        # Get the current directory


if __name__ == '__main__':
    iterm2.run_until_complete(main)
