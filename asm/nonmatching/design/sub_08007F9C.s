	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007F9C
sub_08007F9C: @ 0x08007F9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _080080F4 @ =gUnknown_0808D7F4
	mov r8, r0
	cmp r7, #0
	ble _0800801A
	subs r5, r7, #1
	cmp r6, #0
	ble _08007FD2
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080080F8
_08007FD2:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080080F8
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _0800801A
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080080F8
_0800801A:
	cmp r6, #0
	ble _0800803C
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_080080F8
_0800803C:
	mov r0, r8
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _0800806A
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_080080F8
_0800806A:
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r7, r0
	bge _080080E0
	adds r5, r7, #1
	cmp r6, #0
	ble _0800809A
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080080F8
_0800809A:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080080F8
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _080080E0
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080080F8
_080080E0:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08010ADC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080080F4: .4byte gUnknown_0808D7F4

