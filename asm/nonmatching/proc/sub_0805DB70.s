	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DB70
sub_0805DB70: @ 0x0805DB70
	push {r4, r5, r6, r7, lr}
	ldr r4, _0805DBD4 @ =gUnknown_0816DA4C
	ldr r5, [r4]
	ldrh r0, [r5]
	bl sub_08044280
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DBE4
	ldr r2, _0805DBD8 @ =gUnknown_085D3DD0
	ldrh r1, [r5]
	ldr r0, _0805DBDC @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x1c
	adds r0, r0, r2
	ldr r1, [r0]
	cmp r1, #0
	beq _0805DBE4
	movs r0, #2
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805DBE4
	ldr r0, _0805DBE0 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805DBC8
	ldrb r2, [r5]
	movs r0, #0x10
	movs r1, #0
	movs r3, #0
	bl sub_08034534
_0805DBC8:
	ldrh r0, [r5]
	movs r1, #2
	bl sub_0804438C
	b _0805DC92
	.align 2, 0
_0805DBD4: .4byte gUnknown_0816DA4C
_0805DBD8: .4byte gUnknown_085D3DD0
_0805DBDC: .4byte gUnknown_08499598
_0805DBE0: .4byte gUnknown_03003FC0
_0805DBE4:
	ldr r5, [r4]
	ldrh r0, [r5]
	bl sub_0804423C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DC92
	ldrh r0, [r5]
	bl sub_080441D4
	adds r4, r0, #0
	ldrh r0, [r5]
	bl sub_08044208
	subs r3, r0, r4
	ldr r6, _0805DC98 @ =gUnknown_085D3DD0
	ldrh r1, [r5]
	ldr r7, _0805DC9C @ =gUnknown_08499598
	ldr r2, [r7]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x17]
	muls r0, r3, r0
	movs r1, #0x64
	bl Div
	adds r3, r0, #0
	adds r4, r4, r3
	ldrh r0, [r5]
	bl sub_08044094
	cmp r4, r0
	blt _0805DC92
	bl sub_080129E0
	movs r1, #0x64
	bl __umodsi3
	ldrh r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r2, [r1, #0x1d]
	lsls r1, r2, #6
	adds r1, r1, r2
	lsls r2, r1, #2
	adds r1, r2, r6
	ldrb r1, [r1, #0x18]
	cmp r0, r1
	bhs _0805DC92
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r1, [r0]
	cmp r1, #0
	beq _0805DC92
	movs r0, #1
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805DC92
	ldr r0, _0805DCA0 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805DC8A
	ldrb r2, [r5]
	movs r0, #0xf
	movs r1, #0
	movs r3, #0
	bl sub_08034534
_0805DC8A:
	ldrh r0, [r5]
	movs r1, #1
	bl sub_0804438C
_0805DC92:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC98: .4byte gUnknown_085D3DD0
_0805DC9C: .4byte gUnknown_08499598
_0805DCA0: .4byte gUnknown_03003FC0

