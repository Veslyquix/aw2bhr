	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804EA54
sub_0804EA54: @ 0x0804EA54
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _0804EAD4 @ =gUnknown_03004580
	lsls r3, r0, #4
	adds r1, #2
	adds r3, r3, r1
	ldrh r6, [r3]
	lsls r5, r2, #3
	adds r5, r5, r2
	lsls r5, r5, #0x17
	lsrs r5, r5, #0x10
	lsls r1, r0, #8
	ldr r3, _0804EAD8 @ =gUnknown_085D6A48
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #3
	adds r2, r2, r3
	ldrh r2, [r2, #0x12]
	muls r2, r4, r2
	adds r1, r1, r2
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	ldr r2, _0804EADC @ =gUnknown_08551D1C
	mov r8, r2
	ldr r6, _0804EAE0 @ =gUnknown_02029A10
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #2
	movs r3, #0xb4
	muls r3, r0, r3
	adds r2, r2, r3
	adds r2, r2, r6
	ldrb r2, [r2]
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	ldr r3, _0804EAE4 @ =gUnknown_02029BA8
	lsls r2, r2, #2
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r3, #0x18
	adds r2, r2, r3
	ldr r0, [r2]
	adds r0, r0, r5
	ldr r2, _0804EAE8 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x90
	lsls r2, r2, #3
	bl sub_08011E54
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EAD4: .4byte gUnknown_03004580
_0804EAD8: .4byte gUnknown_085D6A48
_0804EADC: .4byte gUnknown_08551D1C
_0804EAE0: .4byte gUnknown_02029A10
_0804EAE4: .4byte gUnknown_02029BA8
_0804EAE8: .4byte 0x06010000

