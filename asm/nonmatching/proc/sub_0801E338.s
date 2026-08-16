	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E338
sub_0801E338: @ 0x0801E338
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	mov sl, r1
	ldr r0, [sp, #0x28]
	mov sb, r0
	ldr r5, _0801E39C @ =gUnknown_0200ED20
	ldr r7, _0801E3A0 @ =gUnknown_03002510
	ldr r0, [r7]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	movs r1, #0
	mov r8, r1
	mov r1, sl
	strh r1, [r0]
	strh r2, [r0, #2]
	adds r5, #4
	adds r4, r4, r5
	str r3, [r4]
	mov r2, r8
	strh r2, [r0, #8]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	mov r2, sb
	strh r2, [r0, #0xa]
	mov r1, ip
	lsls r6, r1, #0x10
	asrs r6, r6, #0x10
	adds r1, r6, #0
	bl sub_0801A718
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801E3A4
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
	movs r0, #0
	b _0801E3A6
	.align 2, 0
_0801E39C: .4byte gUnknown_0200ED20
_0801E3A0: .4byte gUnknown_03002510
_0801E3A4:
	movs r0, #1
_0801E3A6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

