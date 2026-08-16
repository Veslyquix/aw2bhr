	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012198
sub_08012198: @ 0x08012198
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08012204 @ =gUnknown_03002F30
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #8
	movs r1, #0
	bl sub_080119D4
	movs r0, #0
	mov r8, r0
	ldr r5, _08012208 @ =gUnknown_0200B3B4
	adds r6, r5, #0
	movs r7, #0x80
	lsls r7, r7, #0xc
_080121BA:
	lsrs r4, r7, #0x10
	ldr r2, [r5]
	movs r0, #0x40
	adds r1, r4, #0
	bl sub_080119D4
	ldr r2, [r5, #4]
	movs r0, #0x84
	adds r1, r4, #0
	bl sub_080119D4
	ldrh r1, [r6, #8]
	ldrb r0, [r6, #0xa]
	adds r0, #1
	adds r2, r1, #0
	muls r2, r0, r2
	lsls r2, r2, #1
	movs r0, #0x98
	adds r1, r4, #0
	bl sub_080119D4
	adds r5, #0xc
	adds r6, #0xc
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r7, r7, r0
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #3
	ble _080121BA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012204: .4byte gUnknown_03002F30
_08012208: .4byte gUnknown_0200B3B4

