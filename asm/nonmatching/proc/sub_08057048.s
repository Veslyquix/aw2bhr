	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057048
sub_08057048: @ 0x08057048
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sp
	ldr r2, _080570B0 @ =gUnknown_0855388C
	lsrs r0, r0, #0xf
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r3]
	mov r0, sp
	adds r0, #2
	movs r2, #4
	strh r2, [r0]
	add r0, sp, #4
	strh r2, [r0]
	ldr r4, _080570B4 @ =gUnknown_085538A2
	ldr r3, _080570B8 @ =gUnknown_085D6A48
	ldr r0, _080570BC @ =gUnknown_03004580
	lsls r2, r1, #4
	adds r0, #2
	adds r2, r2, r0
	ldrh r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	mov r0, sp
	adds r0, #6
	strh r1, [r0]
	add r0, sp, #8
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	mov r0, sp
	bl sub_080570C4
	ldr r1, _080570C0 @ =gUnknown_03004534
	movs r0, #1
	strh r0, [r1]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080570B0: .4byte gUnknown_0855388C
_080570B4: .4byte gUnknown_085538A2
_080570B8: .4byte gUnknown_085D6A48
_080570BC: .4byte gUnknown_03004580
_080570C0: .4byte gUnknown_03004534

