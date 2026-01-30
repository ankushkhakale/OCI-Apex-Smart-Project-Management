# 🛠️ Oracle APEX Setup Instructions

Since you are new to Oracle APEX, please follow these steps carefully to set up your backend.

## 1. Access SQL Workshop

1.  Log in to your **Oracle APEX Workspace**.
2.  On the main dashboard, click on **SQL Workshop**.
3.  Click on **SQL Scripts**.

## 2. Upload and Run Scripts

You will need to run the scripts we created in the specific order below. You can copy-paste the content or upload the files.

### Step 2.1: Create Tables (`schema.sql`)
1.  Click **Create** > **Copy and Paste**.
2.  Open the file `sql/schema.sql` on your computer (or copy the content if you are viewing this in an editor).
3.  Paste the content into the Script Editor.
4.  Name the script `1_Schema_Setup`.
5.  Click **Run**.
6.  Click **Run Now** on the confirmation page.
7.  **Verify**: Ensure it says "Statement processed" for the CREATE TABLE commands.

### Step 2.2: Load Logic (`pkg_event_manager.sql`)
1.  Go back to **SQL Scripts**.
2.  Click **Create** > **Copy and Paste**.
3.  Copy the content from `sql/pkg_event_manager.sql`.
4.  Paste it into the editor.
5.  Name the script `2_Package_Logic`.
6.  Click **Run**.
7.  Click **Run Now**.
8.  **Verify**: Ensure it says "Package created" and "Package Body created".

### Step 2.3: Load Data (`seed_data.sql`)
1.  Go back to **SQL Scripts**.
2.  Click **Create** > **Copy and Paste**.
3.  Copy the content from `sql/seed_data.sql`.
4.  Paste it into the editor.
5.  Name the script `3_Seed_Data`.
6.  Click **Run**.
7.  Click **Run Now**.

## 3. Verify Database Objects

1.  Go to **SQL Workshop** > **Object Browser`.
2.  On the left sidebar, you should see your tables: `EVENTS`, `PARTICIPANTS`, `REGISTRATIONS`, etc.
3.  You can click on **Data** tab for `EVENTS` to see the sample data we inserted.
4.  Select **Packages** from the dropdown object type selector (it usually defaults to Tables).
5.  You should see `PKG_EVENT_MANAGER`.

## 4. Building the Application (Step-by-Step)

Now that the database is ready, we will create the actual web interface.

1.  **Go to App Builder**:
    *   Click on **App Builder** in the top navigation bar of your workspace.
    *   Click the big blue **Create** button.

2.  **Select Application Type**:
    *   Choose **New Application**.

3.  **Configure the Application**:
    *   **Name**: Enter `Event Management Portal`.
    *   **Appearance**: You can leave the default (Vita) or click to change the icon/theme.

4.  **Add Pages**:
    *   APEX might automatically suggest pages based on your tables. If not, we will add them manually.
    *   **Add "Events" Page**:
        *   Click **Add Page**.
        *   Select **Interactive Report**.
        *   **Page Name**: `Events`.
        *   **Table**: Select `EVENTS`.
        *   **Include Form**: Check this box (this creates a page to Add/Edit events).
            *   **Form Page Name**: Enter `Event Details` (IMPORTANT: You must fill this).
            *   **Primary Key**: If asked, ensure `EVENT_ID` is selected for Column 1, and leave Column 2 empty.
        *   Click **Add Page**.
    *   **Add "Participants" Page**:
        *   Click **Add Page**.
        *   Select **Interactive Report**.
        *   **Page Name**: `Participants`.
        *   **Table**: Select `PARTICIPANTS`.
        *   **Include Form**: Check this box.
            *   **Form Page Name**: Enter `Participant Details` (IMPORTANT: You must fill this).
            *   **Primary Key**: If asked, ensure `PARTICIPANT_ID` is selected for Column 1.
        *   Click **Add Page**.
    *   **Add "Calendar" Page**:
        *   Click **Add Page**.
        *   Select **Calendar**.
        *   **Page Name**: `Event Schedule`.
        *   **Table**: Select `EVENTS`.
        *   **Display Column**: `TITLE`.
        *   **Start Date Column**: `START_DATE`.
        *   **End Date Column**: `END_DATE`.
        *   Click **Add Page**.

5.  **Finalize and Create**:
    *   **Look at the Top Right**: There is usually a blue **Create Application** button in the top right corner of the page.
    *   **Or Scroll to Bottom**: There is also one at the very bottom.
    *   Click either one **once**.
    *   **Wait**: You will see a loading spinner. This might take 10-30 seconds as APEX builds all the pages and navigation menus for you.
    *   **Success**: When finished, you will be automatically redirected to the **App Builder Dashboard** for your new application.

6.  **Run Your App**:
    *   Once created, you will be taken to the Page Designer/App Dashboard.
    *   Click the **Run Application** button (Play icon).
    *   Login with your workspace username and password.

## 5. Next Steps
*   Explore the **Events** page: Try clicking "Create" to add a new event.
*   Explore the **Calendar** page: See if your events show up.
