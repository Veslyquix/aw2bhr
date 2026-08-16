	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BCB8
sub_0804BCB8: @ 0x0804BCB8
	push {r4, r5, lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, _0804BD18 @ =gUnknown_0300450C
	ldrh r0, [r0]
	cmp r4, r0
	bne _0804BD10
	ldr r0, _0804BD1C @ =gUnknown_03004504
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804BCEC
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0804BCEC
	movs r2, #0
	movs r3, #0
_0804BCEC:
	mov r0, sp
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	add r0, sp, #4
	strh r2, [r0]
	adds r0, #2
	strh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	add r0, sp, #0xc
	strh r3, [r0]
	mov r0, sp
	bl sub_08056E28
_0804BD10:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD18: .4byte gUnknown_0300450C
_0804BD1C: .4byte gUnknown_03004504

