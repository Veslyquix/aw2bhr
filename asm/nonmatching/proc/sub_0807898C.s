	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807898C
sub_0807898C: @ 0x0807898C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08078ABC @ =gDispIo
	ldrb r1, [r0]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	ldr r1, _08078ABC @ =gDispIo
	strb r0, [r1]
	ldrb r0, [r1, #1]
	movs r6, #1
	orrs r0, r6
	movs r3, #2
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	ldr r1, _08078ABC @ =gDispIo
	strb r0, [r1, #1]
	ldr r0, _08078AC0 @ =gUnknown_03002B6C
	mov r8, r0
	ldrb r0, [r0]
	movs r2, #4
	rsbs r2, r2, #0
	adds r4, r2, #0
	ands r4, r0
	ldr r1, _08078AC4 @ =gUnknown_03001FE8
	mov sl, r1
	ldrb r0, [r1]
	adds r5, r2, #0
	ands r5, r0
	orrs r5, r3
	ldr r0, _08078AC8 @ =gUnknown_030030B4
	mov ip, r0
	ldrb r0, [r0]
	ands r2, r0
	orrs r2, r6
	ldr r7, _08078ACC @ =gUnknown_0300251C
	ldrb r6, [r7]
	movs r0, #3
	orrs r6, r0
	movs r1, #0xd
	rsbs r1, r1, #0
	mov sb, r1
	ands r4, r1
	mov r0, r8
	ldrb r1, [r0, #1]
	movs r3, #0x20
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0xe
	orrs r0, r1
	movs r1, #0x7f
	ands r4, r1
	mov r1, r8
	strb r4, [r1]
	movs r4, #0x3f
	ands r0, r4
	strb r0, [r1, #1]
	mov r0, sb
	ands r5, r0
	mov r0, sl
	ldrb r1, [r0, #1]
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x1e
	orrs r0, r1
	movs r1, #0x7f
	ands r5, r1
	mov r1, sl
	strb r5, [r1]
	ands r0, r4
	strb r0, [r1, #1]
	mov r0, sb
	ands r2, r0
	movs r1, #8
	orrs r2, r1
	mov r1, ip
	ldrb r0, [r1, #1]
	ands r3, r0
	movs r0, #0xf
	orrs r3, r0
	movs r0, #0x7f
	ands r2, r0
	strb r2, [r1]
	ands r3, r4
	strb r3, [r1, #1]
	mov r1, sb
	ands r6, r1
	movs r0, #8
	orrs r6, r0
	ldrb r0, [r7, #1]
	movs r1, #0x1f
	orrs r0, r1
	movs r1, #0x7f
	ands r6, r1
	strb r6, [r7]
	ands r0, r4
	strb r0, [r7, #1]
	ldr r0, _08078AD0 @ =gUnknown_03001FF8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08078AD4 @ =gUnknown_03001418
	strh r1, [r0]
	ldr r0, _08078AD8 @ =gUnknown_03002B34
	strh r1, [r0]
	ldr r0, _08078ADC @ =gUnknown_03002F18
	strh r1, [r0]
	ldr r0, _08078AE0 @ =gUnknown_030030A0
	strh r1, [r0]
	ldr r0, _08078AE4 @ =gUnknown_03001400
	strh r1, [r0]
	ldr r0, _08078AE8 @ =gUnknown_0300200C
	strh r1, [r0]
	ldr r0, _08078AEC @ =gUnknown_03002000
	strh r1, [r0]
	bl sub_08013C00
	bl sub_08013C54
	bl sub_08013CA8
	bl sub_080616F0
	ldr r1, _08078ABC @ =gDispIo
	ldrb r0, [r1]
	movs r1, #0x40
	orrs r0, r1
	ldr r1, _08078ABC @ =gDispIo
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078ABC: .4byte gDispIo
_08078AC0: .4byte gUnknown_03002B6C
_08078AC4: .4byte gUnknown_03001FE8
_08078AC8: .4byte gUnknown_030030B4
_08078ACC: .4byte gUnknown_0300251C
_08078AD0: .4byte gUnknown_03001FF8
_08078AD4: .4byte gUnknown_03001418
_08078AD8: .4byte gUnknown_03002B34
_08078ADC: .4byte gUnknown_03002F18
_08078AE0: .4byte gUnknown_030030A0
_08078AE4: .4byte gUnknown_03001400
_08078AE8: .4byte gUnknown_0300200C
_08078AEC: .4byte gUnknown_03002000

