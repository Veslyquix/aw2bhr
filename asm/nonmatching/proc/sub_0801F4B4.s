	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F4B4
sub_0801F4B4: @ 0x0801F4B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	str r2, [sp]
	ldr r0, _0801F598 @ =gUnknown_030040E0
	movs r1, #0
	str r1, [r0]
	ldr r0, _0801F59C @ =gUnknown_03003FBC
	strb r1, [r0]
	ldr r5, _0801F5A0 @ =gUnknown_03003F64
	ldr r4, _0801F5A4 @ =gUnknown_084999C8
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2c
	str r1, [r5]
	ldr r2, _0801F5A8 @ =gUnknown_0300409C
	ldr r7, _0801F5AC @ =0x000005A4
	adds r1, r0, r7
	str r1, [r2]
	movs r1, #0
	mov r8, r1
	strh r3, [r0, #0x20]
	mov r2, sp
	ldrh r2, [r2, #0x24]
	strh r2, [r0, #0x22]
	adds r0, #0x24
	movs r7, #1
	mov sb, r7
	mov r1, sb
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x26
	movs r1, #4
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	ldr r2, [r4]
	ldr r0, _0801F5B0 @ =gUnknown_03004480
	ldrh r1, [r0]
	ldr r0, _0801F5B4 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r2, #0x2a
	strb r0, [r2]
	movs r0, #0xff
	bl sub_0801F838
	ldr r0, [sp]
	bl sub_0801F888
	ldr r0, [r5]
	mov r2, sl
	strb r2, [r0]
	ldr r0, [r5]
	strb r6, [r0, #1]
	ldr r0, [r5]
	mov r7, sb
	strb r7, [r0, #2]
	ldr r0, [r5]
	mov r1, r8
	strb r1, [r0, #3]
	ldr r0, _0801F5B8 @ =gUnknown_03003340
	lsls r6, r6, #2
	adds r6, r6, r0
	ldr r0, [r6]
	add r0, sl
	strb r1, [r0]
	ldr r1, [r5]
	adds r0, r1, #4
	str r0, [r5]
	mov r2, r8
	strb r2, [r1, #6]
	ldr r7, _0801F5BC @ =gUnknown_0809091C
	mov r8, r7
	ldr r0, _0801F5C0 @ =gUnknown_08090920
	mov sb, r0
	ldr r5, _0801F5C4 @ =gUnknown_08090924
	ldr r4, _0801F5C8 @ =gUnknown_08090928
_0801F570:
	mov r1, sb
	ldr r6, [r1]
	ldrb r3, [r6]
	cmp r3, #0
	bne _0801F5CC
	ldr r2, [r5]
	ldr r0, _0801F5A4 @ =gUnknown_084999C8
	ldr r1, [r0]
	ldr r7, _0801F5AC @ =0x000005A4
	adds r0, r1, r7
	str r0, [r2]
	ldr r0, [r4]
	adds r1, #0x2c
	str r1, [r0]
	movs r0, #1
	strb r0, [r6]
	mov r1, r8
	ldr r0, [r1]
	str r3, [r0]
	b _0801F5EC
	.align 2, 0
_0801F598: .4byte gUnknown_030040E0
_0801F59C: .4byte gUnknown_03003FBC
_0801F5A0: .4byte gUnknown_03003F64
_0801F5A4: .4byte gUnknown_084999C8
_0801F5A8: .4byte gUnknown_0300409C
_0801F5AC: .4byte 0x000005A4
_0801F5B0: .4byte gUnknown_03004480
_0801F5B4: .4byte gUnknown_08499598
_0801F5B8: .4byte gUnknown_03003340
_0801F5BC: .4byte gUnknown_0809091C
_0801F5C0: .4byte gUnknown_08090920
_0801F5C4: .4byte gUnknown_08090924
_0801F5C8: .4byte gUnknown_08090928
_0801F5CC:
	ldr r2, [r5]
	ldr r0, _0801F610 @ =gUnknown_084999C8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	str r0, [r2]
	ldr r0, [r4]
	ldr r2, _0801F614 @ =0x000005A4
	adds r1, r1, r2
	str r1, [r0]
	movs r0, #0
	strb r0, [r6]
	mov r7, r8
	ldr r1, [r7]
	movs r0, #0
	str r0, [r1]
_0801F5EC:
	adds r1, r4, #0
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0801F6E0
_0801F5F8:
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	subs r0, #1
	cmp r0, #4
	bhi _0801F6C6
	lsls r0, r0, #2
	ldr r1, _0801F618 @ =_0801F61C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801F610: .4byte gUnknown_084999C8
_0801F614: .4byte 0x000005A4
_0801F618: .4byte _0801F61C
_0801F61C: @ jump table
	.4byte _0801F630 @ case 0
	.4byte _0801F654 @ case 1
	.4byte _0801F66E @ case 2
	.4byte _0801F688 @ case 3
	.4byte _0801F6A8 @ case 4
_0801F630:
	movs r0, #2
	movs r1, #0
	movs r2, #0xff
	bl sub_0801F6F0
	movs r0, #3
	movs r1, #0
	movs r2, #1
	bl sub_0801F6F0
	movs r0, #4
	movs r1, #0xff
	movs r2, #0
	bl sub_0801F6F0
	movs r0, #5
	movs r1, #1
	b _0801F6A0
_0801F654:
	movs r0, #2
	movs r1, #0
	movs r2, #0xff
	bl sub_0801F6F0
	movs r0, #4
	movs r1, #0xff
	movs r2, #0
	bl sub_0801F6F0
	movs r0, #5
	movs r1, #1
	b _0801F6A0
_0801F66E:
	movs r0, #3
	movs r1, #0
	movs r2, #1
	bl sub_0801F6F0
	movs r0, #4
	movs r1, #0xff
	movs r2, #0
	bl sub_0801F6F0
	movs r0, #5
	movs r1, #1
	b _0801F6A0
_0801F688:
	movs r0, #2
	movs r1, #0
	movs r2, #0xff
	bl sub_0801F6F0
	movs r0, #3
	movs r1, #0
	movs r2, #1
	bl sub_0801F6F0
	movs r0, #4
	movs r1, #0xff
_0801F6A0:
	movs r2, #0
	bl sub_0801F6F0
	b _0801F6C6
_0801F6A8:
	movs r0, #2
	movs r1, #0
	movs r2, #0xff
	bl sub_0801F6F0
	movs r0, #3
	movs r1, #0
	movs r2, #1
	bl sub_0801F6F0
	movs r0, #5
	movs r1, #1
	movs r2, #0
	bl sub_0801F6F0
_0801F6C6:
	ldr r0, [r5]
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #2]
	ldr r1, [r4]
	ldr r2, [r1]
	adds r0, r2, #4
	str r0, [r1]
	adds r1, r4, #0
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _0801F5F8
	b _0801F570
_0801F6E0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

