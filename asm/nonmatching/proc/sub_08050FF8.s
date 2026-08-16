	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050FF8
sub_08050FF8: @ 0x08050FF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08051158 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r0, _0805115C @ =gUnknown_020298E0
	mov sb, r0
	ldr r1, _08051160 @ =gUnknown_0300453C
	mov r8, r1
	ldrh r0, [r1]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #4
	mov r2, sb
	adds r0, r1, r2
	ldrh r0, [r0, #0x16]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08051164 @ =gUnknown_02029906
	adds r0, r0, r1
	movs r3, #0
	movs r5, #1
	movs r7, #1
	strh r7, [r0]
	ldr r2, _08051168 @ =gUnknown_03001470
	mov sl, r2
	ldr r1, _08051158 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	mov r0, sl
	adds r0, #0x28
	adds r1, r1, r0
	mov r0, r8
	ldrh r2, [r0]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #4
	add r0, sb
	ldrh r0, [r0, #0x16]
	subs r0, #1
	str r0, [r1]
	ldr r2, _08051158 @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r1, sl
	adds r1, #0x2c
	adds r0, r0, r1
	str r3, [r0]
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r1, sl
	adds r1, #0x30
	adds r0, r0, r1
	mov r2, r8
	ldrh r1, [r2]
	str r1, [r0]
	ldr r0, _08051158 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	mov r1, sl
	adds r1, #0x34
	adds r0, r0, r1
	ldr r2, _0805116C @ =gUnknown_0300451C
	ldrh r1, [r2]
	str r1, [r0]
	ldr r2, _08051170 @ =gUnknown_08552394
	ldr r0, _08051174 @ =gUnknown_02029664
	ldr r1, [r0]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1f
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #2
	ldrb r0, [r4, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	orrs r1, r2
	mov r0, r8
	ldrh r2, [r0]
	movs r0, #1
	ands r2, r0
	lsls r2, r2, #4
	ldrb r3, [r4, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #3]
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r4, #5]
	mov r1, r8
	ldrh r0, [r1]
	eors r5, r0
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	add r0, sb
	ldrh r1, [r0]
	ldr r2, _08051178 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _0805117C @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r1, _08051158 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r4, _08051180 @ =gUnknown_081360E0
	ldr r2, [r4]
	ldr r3, _08051184 @ =gUnknown_081360E4
	ldr r1, [r3]
	mov r0, r8
	ldrh r5, [r0]
	lsls r0, r5, #4
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	ldr r1, _08051188 @ =gUnknown_081360D8
	mov sb, r1
	ldr r2, _0805118C @ =gUnknown_081360DC
	mov r8, r2
	mov sl, r3
	cmp r0, #0
	bne _08051190
	ldr r0, _0805116C @ =gUnknown_0300451C
	ldrh r1, [r0]
	lsls r1, r1, #1
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r2, _08051164 @ =gUnknown_02029906
	adds r1, r1, r2
	b _080511A6
	.align 2, 0
_08051158: .4byte gUnknown_03001FBC
_0805115C: .4byte gUnknown_020298E0
_08051160: .4byte gUnknown_0300453C
_08051164: .4byte gUnknown_02029906
_08051168: .4byte gUnknown_03001470
_0805116C: .4byte gUnknown_0300451C
_08051170: .4byte gUnknown_08552394
_08051174: .4byte gUnknown_02029664
_08051178: .4byte 0x000003FF
_0805117C: .4byte 0xFFFFFC00
_08051180: .4byte gUnknown_081360E0
_08051184: .4byte gUnknown_081360E4
_08051188: .4byte gUnknown_081360D8
_0805118C: .4byte gUnknown_081360DC
_08051190:
	ldr r1, _080511F4 @ =gUnknown_08552148
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #1
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r1, r1, r0
	ldr r0, _080511F8 @ =gUnknown_02029906
	adds r1, r1, r0
_080511A6:
	strh r7, [r1]
	mov r1, sl
	ldr r2, [r1]
	mov r0, r8
	ldr r5, [r0]
	ldrh r0, [r5]
	movs r6, #1
	eors r0, r6
	lsls r1, r0, #4
	adds r7, r2, #4
	adds r0, r1, r7
	ldrh r4, [r0]
	cmp r4, #1
	bne _0805124A
	adds r0, r2, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0xd
	bne _08051200
	ldr r2, _080511FC @ =gUnknown_085643A8
	mov r1, sb
	ldr r3, [r1]
	ldrh r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r3
	adds r0, #0x8c
	ldrb r0, [r0]
	ands r4, r0
	lsls r0, r4, #1
	adds r2, #4
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_0803B48C
	b _08051230
	.align 2, 0
_080511F4: .4byte gUnknown_08552148
_080511F8: .4byte gUnknown_02029906
_080511FC: .4byte gUnknown_085643A8
_08051200:
	ldr r3, _080512F8 @ =gUnknown_085643A8
	mov r0, sb
	ldr r2, [r0]
	ldrh r1, [r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r0, #0x8c
	ldrb r0, [r0]
	ands r4, r0
	lsls r2, r4, #1
	eors r1, r6
	lsls r1, r1, #4
	adds r1, r1, r7
	ldrh r0, [r1]
	subs r0, #1
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r2, r2, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	bl sub_0803B48C
_08051230:
	mov r0, sb
	ldr r2, [r0]
	mov r1, r8
	ldr r0, [r1]
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r0, #0x8c
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
_0805124A:
	ldr r1, _080512FC @ =gUnknown_02029A10
	ldr r0, _08051300 @ =gUnknown_0300451C
	ldrh r0, [r0]
	lsls r3, r0, #3
	adds r3, r3, r0
	lsls r3, r3, #2
	mov r2, r8
	ldr r7, [r2]
	ldrh r5, [r7]
	movs r0, #0xb4
	muls r0, r5, r0
	adds r3, r3, r0
	adds r3, r3, r1
	ldr r0, _08051304 @ =gUnknown_08553B58
	lsls r2, r5, #1
	adds r0, r2, r0
	ldrh r4, [r0]
	ldrh r0, [r3, #8]
	adds r4, r4, r0
	ldr r1, _08051308 @ =gUnknown_08553B5C
	mov r8, r1
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r5, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0805130C @ =gUnknown_085D6A48
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	lsls r0, r0, #3
	adds r2, r2, r0
	add r2, r8
	ldrh r0, [r2]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _08051310 @ =gUnknown_08553BFC
	lsls r1, r5, #3
	adds r1, r1, r5
	lsls r1, r1, #4
	ldr r2, _08051314 @ =gUnknown_020298E0
	adds r1, r1, r2
	ldrh r2, [r1, #0x18]
	lsls r0, r2, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, #1
	strh r2, [r1, #0x18]
	ldrh r1, [r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, _08051314 @ =gUnknown_020298E0
	adds r2, r0, r1
	ldrh r0, [r2, #0x18]
	cmp r0, #3
	bne _080512D2
	movs r0, #0
	strh r0, [r2, #0x18]
_080512D2:
	ldrh r0, [r7]
	ldr r1, _08051318 @ =gUnknown_03001FBC
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	bl sub_08050528
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080512F8: .4byte gUnknown_085643A8
_080512FC: .4byte gUnknown_02029A10
_08051300: .4byte gUnknown_0300451C
_08051304: .4byte gUnknown_08553B58
_08051308: .4byte gUnknown_08553B5C
_0805130C: .4byte gUnknown_085D6A48
_08051310: .4byte gUnknown_08553BFC
_08051314: .4byte gUnknown_020298E0
_08051318: .4byte gUnknown_03001FBC

