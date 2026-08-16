	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080610D0
sub_080610D0: @ 0x080610D0
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08061160 @ =gUnknown_030033EC
	ldrh r0, [r4]
	ldr r5, _08061164 @ =gUnknown_030046C0
	ldrb r1, [r5, #6]
	bl sub_08042C9C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrh r2, [r4]
	ldr r0, _08061168 @ =gUnknown_08499598
	ldr r3, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r1, r0
	bhi _08061156
	ldr r0, _0806116C @ =gUnknown_03004674
	ldr r0, [r0]
	cmp r0, #0x3f
	bgt _08061156
	ldrb r0, [r5, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08061178
	strb r0, [r5, #7]
	mov r4, sp
	mov r0, sp
	bl sub_080611D8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061156
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4, #2]
	ldrb r2, [r5, #6]
	bl sub_08025E08
	movs r1, #0
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	ldrb r1, [r5, #7]
	strb r1, [r0, #0xb]
	ldr r1, _08061170 @ =gUnknown_03003100
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldr r0, _08061174 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061156
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	movs r0, #0xe
	movs r3, #0
	bl sub_08034534
_08061156:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061160: .4byte gUnknown_030033EC
_08061164: .4byte gUnknown_030046C0
_08061168: .4byte gUnknown_08499598
_0806116C: .4byte gUnknown_03004674
_08061170: .4byte gUnknown_03003100
_08061174: .4byte gUnknown_03003FC0

