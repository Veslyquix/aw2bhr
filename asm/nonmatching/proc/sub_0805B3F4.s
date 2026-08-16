	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B3F4
sub_0805B3F4: @ 0x0805B3F4
	push {r4, lr}
	sub sp, #0x1c
	mov r0, sp
	movs r1, #0
	movs r2, #0x19
	bl sub_0808B6C4
	mov r0, sp
	adds r0, #1
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #5
	strb r1, [r0]
	mov r1, sp
	adds r1, #9
	movs r0, #9
	strb r0, [r1]
	ldr r4, _0805B46C @ =gUnknown_08499590
	ldr r0, [r4]
	ldr r1, _0805B470 @ =0x00003C72
	adds r0, r0, r1
	movs r1, #0
	bl sub_080581A4
	ldr r0, [r4]
	ldr r1, _0805B474 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r2, _0805B478 @ =gUnknown_08499594
	ldr r0, _0805B47C @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r1, [r3, #7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r2, _0805B480 @ =gUnknown_030046D4
	ldrb r0, [r1]
	str r0, [r2]
	ldrb r0, [r3, #0xb]
	cmp r0, #7
	bls _0805B454
	movs r0, #1
	strb r0, [r3, #0xb]
_0805B454:
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _0805B488
	ldr r0, _0805B484 @ =gUnknown_08576890
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0805B49A
	.align 2, 0
_0805B46C: .4byte gUnknown_08499590
_0805B470: .4byte 0x00003C72
_0805B474: .4byte 0x00002852
_0805B478: .4byte gUnknown_08499594
_0805B47C: .4byte gUnknown_030040D8
_0805B480: .4byte gUnknown_030046D4
_0805B484: .4byte gUnknown_08576890
_0805B488:
	ldr r1, _0805B4A4 @ =gUnknown_08576890
	ldr r0, [r2]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_0805B49A:
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B4A4: .4byte gUnknown_08576890

