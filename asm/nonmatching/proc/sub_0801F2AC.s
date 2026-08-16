	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F2AC
sub_0801F2AC: @ 0x0801F2AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	bl sub_0801F3D4
	ldr r2, _0801F32C @ =gUnknown_0200F920
	lsls r1, r0, #4
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r4, r1, r2
	movs r3, #0
	ldrb r0, [r4, #5]
	cmp r3, r0
	bge _0801F33E
	ldr r1, _0801F330 @ =gUnknown_0848B780
	lsls r0, r5, #2
	adds r6, r0, r1
	adds r2, r4, #0
	adds r2, #8
	mov ip, r1
_0801F2DA:
	ldrh r0, [r2, #2]
	cmp r0, r5
	bne _0801F334
	ldrh r3, [r2]
	ldrb r0, [r4, #4]
	lsls r0, r0, #0xc
	orrs r3, r0
	movs r1, #0
	lsls r0, r5, #2
	ldrb r6, [r6, #1]
	cmp r1, r6
	bge _0801F33E
	mov sb, r0
	mov r4, sb
	add r4, ip
	ldr r7, _0801F330 @ =gUnknown_0848B780
	mov ip, r7
_0801F2FC:
	movs r2, #0
	mov r6, r8
	adds r6, #0x40
	adds r5, r1, #1
	ldrb r0, [r4]
	cmp r2, r0
	bge _0801F31E
	mov r0, sb
	add r0, ip
	mov r1, r8
_0801F310:
	strh r3, [r1]
	adds r3, #1
	adds r1, #2
	adds r2, #1
	ldrb r7, [r0]
	cmp r2, r7
	blt _0801F310
_0801F31E:
	mov r8, r6
	adds r1, r5, #0
	ldrb r0, [r4, #1]
	cmp r1, r0
	blt _0801F2FC
	b _0801F33E
	.align 2, 0
_0801F32C: .4byte gUnknown_0200F920
_0801F330: .4byte gUnknown_0848B780
_0801F334:
	adds r2, #4
	adds r3, #1
	ldrb r7, [r4, #5]
	cmp r3, r7
	blt _0801F2DA
_0801F33E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

