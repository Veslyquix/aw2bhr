	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044610
sub_08044610: @ 0x08044610
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r5, sl
	adds r5, #0x64
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r4, _08044714 @ =gUnknown_0809138C
	ldr r0, [r4]
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0804463C
	b _080447DC
_0804463C:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #4
	bgt _08044646
	b _080447DC
_08044646:
	movs r0, #0
	strh r0, [r5]
	mov r6, sl
	adds r6, #0x68
	movs r2, #0
	ldrsh r0, [r6, r2]
	mov sb, r6
	cmp r0, #0x32
	ble _0804465A
	b _080447C8
_0804465A:
	ldr r2, _08044718 @ =gUnknown_08499594
	ldr r1, _0804471C @ =gUnknown_03003F2C
	movs r3, #0
	ldrsh r0, [r6, r3]
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08044678
	b _080447B4
_08044678:
	ldr r5, _08044720 @ =gUnknown_084A0090
	ldr r7, _08044724 @ =gUnknown_030033EC
	ldrh r0, [r7]
	ldr r1, _08044728 @ =gUnknown_08499598
	mov r8, r1
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1f]
	subs r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x20
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080446B4
	b _080447B4
_080446B4:
	ldr r0, _0804472C @ =gUnknown_08499590
	ldr r1, [r0]
	ldrb r3, [r4, #3]
	lsls r2, r3, #1
	mov ip, r2
	ldr r2, _08044730 @ =0x0000417A
	adds r0, r1, r2
	add r0, ip
	ldrh r0, [r0]
	ldrb r2, [r4, #2]
	adds r0, r0, r2
	mov ip, r0
	ldr r0, _08044734 @ =0x0000234A
	adds r1, r1, r0
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	beq _080446E2
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08044738
_080446E2:
	ldrh r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1f]
	subs r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _080447A6
	.align 2, 0
_08044714: .4byte gUnknown_0809138C
_08044718: .4byte gUnknown_08499594
_0804471C: .4byte gUnknown_03003F2C
_08044720: .4byte gUnknown_084A0090
_08044724: .4byte gUnknown_030033EC
_08044728: .4byte gUnknown_08499598
_0804472C: .4byte gUnknown_08499590
_08044730: .4byte 0x0000417A
_08044734: .4byte 0x0000234A
_08044738:
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_08029088
	ldr r0, _080447B0 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080447DC
	ldrh r0, [r7]
	mov r3, r8
	ldr r2, [r3]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1f]
	subs r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	ldrb r3, [r4, #2]
	ldrb r4, [r4, #3]
	movs r5, #0
	ldrh r1, [r7]
	mov r0, r8
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1f]
	cmp r0, #2
	bne _0804479C
	movs r5, #1
_0804479C:
	adds r0, r3, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_08044B08
_080447A6:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	b _080447C8
	.align 2, 0
_080447B0: .4byte gUnknown_0849A00C
_080447B4:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	mov r6, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	bgt _080447C8
	b _0804465A
_080447C8:
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x33
	bne _080447D8
	mov r0, sl
	bl Proc_Break
_080447D8:
	bl sub_08024268
_080447DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

