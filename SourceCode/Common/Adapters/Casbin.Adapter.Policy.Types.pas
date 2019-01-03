// Copyright 2018 The Casbin Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
unit Casbin.Adapter.Policy.Types;

interface

uses
  Casbin.Adapter.Types;

type
  IPolicyAdapter = interface (IAdapter)
    ['{56990FAD-9212-4169-8A94-D55039D1F403}']
    function getAutoSave: Boolean;
    function getCached: boolean;
    procedure setAutoSave(const aValue: Boolean);
    procedure setCached(const aValue: boolean);

    procedure add (const aTag: string);
    function getCacheSize: Integer;

    {$REGION 'Removes a policy rule from the adapter'}
    /// <summary>
    ///   Removes a policy rule from the adapter
    /// </summary>
    /// <param name="aPolicyDefinition">
    ///   The tag of the policy (e.g. p, g, g2)
    /// </param>
    /// <example>
    ///   <list type="bullet">
    ///     <item>
    ///       <font color="#2A2A2A">remove ('p')</font>
    ///     </item>
    ///   </list>
    /// </example>
    {$ENDREGION}
    procedure remove (const aPolicyDefinition: string); overload;

    {$REGION 'Removes a policy rule from the adapter'}
    /// <summary>
    ///   Removes a policy rule from the adapter
    /// </summary>
    /// <param name="aPolicyDefinition">
    ///   The definition of the policy (e.g. p=sub, act)
    /// </param>
    /// <param name="aFilter">
    ///   It can contain the tag of the rule (e.g. 'p') or a filter.The filter
    ///   should be assigned to an object as defined in the model (Policy)
    ///   using the assign operator <br />
    /// </param>
    /// <example>
    ///   <list type="bullet">
    ///     <item>
    ///       <font color="#2A2A2A">remove ('p')</font>
    ///     </item>
    ///     <item>
    ///       <font color="#2A2A2A">remove ('sub=john')</font>
    ///     </item>
    ///     <item>
    ///       <font color="#2A2A2A">remove ('domain=network*')</font>
    ///     </item>
    ///   </list>
    /// </example>
    {$ENDREGION}
    procedure remove (const aPolicyDefinition: string; const aFilter: string); overload;
    procedure setCacheSize(const aValue: Integer);

    property AutoSave: Boolean read getAutoSave write setAutoSave;
    property Cached: boolean read getCached write setCached;
    property CacheSize: Integer read getCacheSize write setCacheSize;
  end;

const
  DefaultCacheSize = 15;

implementation

end.
